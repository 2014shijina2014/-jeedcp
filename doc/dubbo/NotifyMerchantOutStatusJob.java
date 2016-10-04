package com.kjt.wmshub.web.quartzJob;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.quartz.DisallowConcurrentExecution;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.PersistJobDataAfterExecution;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.kjt.platform.dubbo.operation.domain.AccountBooks;
import com.kjt.wmshub.service.intf.IBaseService;
import com.kjt.wmshub.service.intf.ICustomOrdersService;
import com.kjt.wmshub.service.intf.IWmsDicService;
import com.kjt.wmshub.service.intf.IWmsService;
import com.kjt.wmshub.service.intf.vo.CustomOrders;
import com.kjt.wmshub.service.intf.vo.MerchantBaseInfoVo;
import com.kjt.wmshub.web.service.INotifyMerchantService;
import com.kjt.wmshub.web.utils.Constants;

/**
 * @ClassName: NotifyMerchantOutStatusJob
 * @Description: 通知商户已出库定时任务<br/>
 * 注解PersistJobDataAfterExecution 表示当正常执行完Job后, JobDataMap中的数据应该被改动, 以被下一次调用时用。
 * 注解DisallowConcurrentExecution 禁止并发执行多个相同定义的JobDetail
 * @author wangxl
 * @date 2015年4月1日 上午11:30:07
 */
@PersistJobDataAfterExecution
@DisallowConcurrentExecution 
public class NotifyMerchantOutStatusJob extends QuartzJobBean {
	
	private static final Logger logger = LoggerFactory.getLogger(NotifyMerchantOutStatusJob.class);
	
	private ICustomOrdersService customOrdersService;
	private IWmsService wmsService;
	private IWmsDicService wmsDicService;
	private IBaseService baseService;
	
	
	@Override
	protected void executeInternal(JobExecutionContext context)
			throws JobExecutionException
	{
		logger.info("定时任务调度开始执行->"+System.currentTimeMillis());
		try {
			customOrdersService = (ICustomOrdersService)context.getScheduler().getContext().get("customOrdersService");
			wmsDicService = (IWmsDicService)context.getScheduler().getContext().get("wmsDicService");
			baseService = (IBaseService)context.getScheduler().getContext().get("baseService");
			wmsService = (IWmsService)context.getScheduler().getContext().get("wmsService");
			if(null != wmsService && null != wmsService){
				execute();
			}
        } catch (Exception e) {
            e.printStackTrace();
            logger.info("定时任务调度执行异常->"+e.getMessage(), e);
        }
		logger.info("定时任务调度退出执行->"+System.currentTimeMillis());
	}
	
	public void execute(){
		logger.info("开始为多账册推送出库信息");
		try{
			List<AccountBooks> accountBookList = baseService.getAccountBooksList();
			if(null != accountBookList && accountBookList.size()>0){
				for(AccountBooks accountBooks : accountBookList){
					String tableNameSuffix = "_";
					logger.info("开始为账册[账册ID："+accountBooks.getAccountBookId()+"，关区代码："+accountBooks.getAccountBookCode()+"]推送出库信息。");
					//设置默认账册
					if(com.kjt.wmshub.web.common.Constants.AccountBook_ID.equals(accountBooks.getAccountBookId().toString())){
						tableNameSuffix = "";
					} else {
						tableNameSuffix = "_"+accountBooks.getAccountBookId();
					}
					notifyOutStockStatus(tableNameSuffix);
					logger.info("账册[账册ID："+accountBooks.getAccountBookId()+"，关区代码："+accountBooks.getAccountBookCode()+"]本次推送结束。");
				}
			}
		} catch(Exception ex) {
			ex.printStackTrace();
			logger.error("多账册推送出库信息异常："+ex.getMessage());
		}
		logger.info("多账册推送出库信息结束");
	}
	
	/**
	 * @Title: notifyOutStockStatus 
	 * @Description: 推送出库状态
	 * @param tableNameSuffix 账册标示
	 *     void 
	 * @throws
	 */
	public void notifyOutStockStatus(String tableNameSuffix) {
		/*查找订单表custom_orders中的已出库待通知和通知失败的订单*/
		Map<String,Object> map=new HashMap<String,Object>(); 
		map.put("status", '1');
		Character[] chars={'0','9'};
		map.put("send_statuses", chars);
		map.put("rowNumber", 1000);
		//设置账册
		map.put(com.kjt.wmshub.web.common.Constants.TABLE_NAME_SUFFIX, tableNameSuffix);
		try {
			List<CustomOrders> customOrdersList=customOrdersService.getOutStockOrdersByStatusAndSendStatus(map);
			
			if(!customOrdersList.isEmpty()){
				for(CustomOrders customOrders:customOrdersList){
					//设置账册信息
					customOrders.setTableNameSuffix(tableNameSuffix);
					//进行通知
					Map<String,Object> resultMap=notifyMerchantOutStatus(customOrders);
					
					if (Boolean.TRUE.equals(resultMap.get("success"))) {
						logger.info(customOrders.getCustomerOrderId()+"的出库通知发送成功");
					}else{
						logger.warn(customOrders.getCustomerOrderId()+"的出库通知发送失败");
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 将订单的出库状态通知给商户，不通知“待出库”的状态，商户没有配置“出库通知URL”时也不通知。<p>
	 * 返回一个Map，包含键success、msg和needResend，success的值为Boolean，表示是否通知成功；
	 * 当success的值为false时，msg的值是错误信息，needResend的值为Boolean，表示是否需要尝试再次通知。
	 * @param customerOrder
	 */
	private Map<String, Object> notifyMerchantOutStatus(CustomOrders customOrders) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		boolean needResend = false;
		String msg = null;
		if ("0".equals(customOrders.getStatus())) {
			msg = "订单" + customOrders.getMerchantOrderId() + "的状态是待出库！";
		}
		
		if (msg != null) {
			resultMap.put("success", false);
			resultMap.put("needResend", needResend);
			resultMap.put("msg", msg);
			logger.error(msg);
			return resultMap;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("merchantCode", customOrders.getKjtCode());
		//设置账册
		map.put(com.kjt.wmshub.web.common.Constants.TABLE_NAME_SUFFIX, customOrders.getTableNameSuffix());
		List<MerchantBaseInfoVo> merchantList = wmsDicService.getMerchantAndTradeInfo(map);
		
		if (merchantList.isEmpty()) {
			msg = "查不到订单" + customOrders.getMerchantOrderId() + "的商户信息！";
		} else {
			String deliveryOutNotifyUrl = merchantList.get(0).getDeliveryOutNotifyUrl();
			if (deliveryOutNotifyUrl == null || (deliveryOutNotifyUrl=deliveryOutNotifyUrl.trim()).isEmpty()) {
				msg = "订单" + customOrders.getMerchantOrderId() + "的商户" + customOrders.getKjtCode() + "没有配置出库通知URL！";
			} else {
				String className = merchantList.get(0).getNotifyClassName();
				
				try {
					Class cls = Class.forName(className);
					if (!INotifyMerchantService.class.isAssignableFrom(cls)) {
						msg = "配置的类没有实现INotifyMerchantService接口！";
						logger.error("配置的类" + className + "没有实现INotifyMerchantService接口！");
					} else {
						INotifyMerchantService notifyIntf = (INotifyMerchantService)cls.newInstance();
						msg = notifyIntf.notifyDeliveryOut(deliveryOutNotifyUrl, customOrders, Constants.CHARSET);
						needResend = true;
					}
				} catch (Exception e) {
					msg = "出现异常：" + e.toString();
					needResend = true;
					logger.error(e.toString(), e);
				}
			}
		}
		
		if (msg == null) {
			customOrders.setSendStatus("1");
		} else {
			customOrders.setSendStatus("9");
		}
		
		customOrders.setSendTime(new Date());
		wmsService.updateCustomOrders(customOrders);
		
		resultMap.put("success", msg==null);
		resultMap.put("needResend", needResend);
		resultMap.put("msg", msg);
		return resultMap;
	}
	
}
