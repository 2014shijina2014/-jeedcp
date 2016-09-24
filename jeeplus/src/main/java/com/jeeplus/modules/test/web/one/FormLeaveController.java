/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.test.web.one;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.google.common.collect.Lists;
import com.jeeplus.common.utils.DateUtils;
import com.jeeplus.common.utils.MyBeanUtils;
import com.jeeplus.common.config.Global;
import com.jeeplus.common.persistence.Page;
import com.jeeplus.common.web.BaseController;
import com.jeeplus.common.utils.StringUtils;
import com.jeeplus.common.utils.excel.ExportExcel;
import com.jeeplus.common.utils.excel.ImportExcel;
import com.jeeplus.modules.test.entity.one.FormLeave;
import com.jeeplus.modules.test.service.one.FormLeaveService;
/**
 * 员工请假Controller
 * @author admin
 * @version 2016-09-14
 */
@Controller
@RequestMapping(value = "${adminPath}/test/formLeave")
public class FormLeaveController extends BaseController {
	@Autowired
	private FormLeaveService formLeaveService;

	@ModelAttribute
	public FormLeave get(@RequestParam(required=false) String id) {
		FormLeave entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = formLeaveService.get(id);
		}
		if (entity == null){
			entity = new FormLeave();
		}
		return entity;
	}

	/**
	 * 请假单列表页面
	 */
	@RequiresPermissions("test:formLeave:list")
	@RequestMapping(value = {"list", ""})
	public String list(FormLeave formLeave, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<FormLeave> page = formLeaveService.findPage(new Page<FormLeave>(request, response), formLeave);
		model.addAttribute("page", page);
		return "modules/test/formLeaveList";
	}
	/**
	 * 查看，增加，编辑请假单表单页面
	 */
	@RequiresPermissions(value={"test:formLeave:view","test:formLeave:add","test:formLeave:edit"},logical=Logical.OR)
	@RequestMapping(value = "form")
	public String form(FormLeave formLeave, Model model) {
		model.addAttribute("formLeave", formLeave);
		return "modules/test/formLeaveForm";
	}
	/**
	 * 保存请假单
	 */
	@RequiresPermissions(value={"test:formLeave:add","test:formLeave:edit"},logical=Logical.OR)
	@RequestMapping(value = "save")
	public String save(FormLeave formLeave, Model model, RedirectAttributes redirectAttributes) throws Exception{
		if (!beanValidator(model, formLeave)){
			return form(formLeave, model);
		}
		if(!formLeave.getIsNewRecord()){//编辑表单保存
			FormLeave t = formLeaveService.get(formLeave.getId());//从数据库取出记录的值
			MyBeanUtils.copyBeanNotNull2Bean(formLeave, t);//将编辑表单中的非NULL值覆盖数据库记录中的值
			formLeaveService.save(t);//保存
		}else{//新增表单保存
			formLeaveService.save(formLeave);//保存
		}
		addMessage(redirectAttributes, "保存请假单成功");
		return "redirect:"+Global.getAdminPath()+"/test/formLeave/?repage";
	}

	/**
	 * 删除请假单
	 */
	@RequiresPermissions("test:formLeave:del")
	@RequestMapping(value = "delete")
	public String delete(FormLeave formLeave, RedirectAttributes redirectAttributes) {
		formLeaveService.delete(formLeave);
		addMessage(redirectAttributes, "删除请假单成功");
		return "redirect:"+Global.getAdminPath()+"/test/formLeave/?repage";
	}

	/**
	 * 批量删除请假单
	 */
	@RequiresPermissions("test:formLeave:del")
	@RequestMapping(value = "deleteAll")
	public String deleteAll(String ids, RedirectAttributes redirectAttributes) {
		String idArray[] =ids.split(",");
		for(String id : idArray){
			formLeaveService.delete(formLeaveService.get(id));
		}
		addMessage(redirectAttributes, "删除请假单成功");
		return "redirect:"+Global.getAdminPath()+"/test/formLeave/?repage";
	}

	/**
	 * 导出excel文件
	 */
	@RequiresPermissions("test:formLeave:export")
    @RequestMapping(value = "export", method=RequestMethod.POST)
    public String exportFile(FormLeave formLeave, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
            String fileName = "请假单"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            Page<FormLeave> page = formLeaveService.findPage(new Page<FormLeave>(request, response, -1), formLeave);
    		new ExportExcel("请假单", FormLeave.class).setDataList(page.getList()).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导出请假单记录失败！失败信息："+e.getMessage());
		}
		return "redirect:"+Global.getAdminPath()+"/test/formLeave/?repage";
    }
	/**
	 * 导入Excel数据
	 */
	@RequiresPermissions("test:formLeave:import")
    @RequestMapping(value = "import", method=RequestMethod.POST)
    public String importFile(MultipartFile file, RedirectAttributes redirectAttributes) {
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
			List<FormLeave> list = ei.getDataList(FormLeave.class);
			for (FormLeave formLeave : list){
				try{
					formLeaveService.save(formLeave);
					successNum++;
				}catch(ConstraintViolationException ex){
					failureNum++;
				}catch (Exception ex) {
					failureNum++;
				}
			}
			if (failureNum>0){
				failureMsg.insert(0, "，失败 "+failureNum+" 条请假单记录。");
			}
			addMessage(redirectAttributes, "已成功导入 "+successNum+" 条请假单记录"+failureMsg);
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入请假单失败！失败信息："+e.getMessage());
		}
		return "redirect:"+Global.getAdminPath()+"/test/formLeave/?repage";
    }

	/**
	 * 下载导入请假单数据模板
	 */
	@RequiresPermissions("test:formLeave:import")
    @RequestMapping(value = "import/template")
    public String importFileTemplate(HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
            String fileName = "请假单数据导入模板.xlsx";
    		List<FormLeave> list = Lists.newArrayList();
    		new ExportExcel("请假单数据", FormLeave.class, 1).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入模板下载失败！失败信息："+e.getMessage());
		}
		return "redirect:"+Global.getAdminPath()+"/test/formLeave/?repage";
    }



}