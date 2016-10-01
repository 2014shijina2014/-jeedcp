<#include "/custom.include">
<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>
<#assign actionExtension = "do">
package ${basepackage}.${appName}.${moduleName}.action;


import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import ${basepackage}.${appName}.${moduleName}.entity.${className};
import ${basepackage}.${appName}.${moduleName}.service.I${className}Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jfpal.core.base.BaseAction;
import com.jfpal.core.base.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;


@Controller
@RequestMapping("/${businessName}")
public class ${className}Action  extends BaseAction{
	
	final static Logger logger = LoggerFactory.getLogger(${className}Action.class);
	
	@Autowired
	private I${className}Service ${classNameLower}Service;
	
	/**
	 * 解决页面上日期类型转换问题
	 * @param request
	 * @param binder
	 * @throws Exception
	 */
	@InitBinder
    protected void initBinder(HttpServletRequest request,
            ServletRequestDataBinder binder) throws Exception {
         binder.registerCustomEditor(Date.class, new CustomDateEditor(
                    new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));
       }
	
	/**
	 * 列表信息查询
	 * 
	 * @return String
	 * @author code gen
	 */
	@RequestMapping("")
	public String find${className}s(Model springModel,@ModelAttribute("${classNameLower}") ${className} model)  {
		Page page = ${classNameLower}Service.find${className}s(model, model.getPageNum(),  model.getNumPerPage());
		springModel.addAttribute(page);
		return "${moduleName}/${className}/${className}sQuery";
	}
	
	
	/**
	 * 新增页面
	 * 
	 * @return String
	 * @author by code generator
	 */
	@RequestMapping("/add${className}ToPage")
	public String add${className}(Model model)  {

		return "${moduleName}/${className}/${className}Add";
	}
	/**
	 * 新增保存
	 * 
	 * @return String
	 * @author by code generator
	 */
	@RequestMapping(value="/save${className}Action",method = RequestMethod.POST)
	public ModelAndView save${className}(${className} model,HttpServletRequest request)  {
		${classNameLower}Service.add(model);
		return ajaxDoneSuccess("成功");
	}
	/**
	 * 删除
	 * 
	 * @return String
	 * @author by code generator
	 */
	@RequestMapping("/delete/{pk_Id}")
	public ModelAndView delete${className}(@PathVariable("pk_Id") String pk_Id)  {
//		${classNameLower}Service.delete(pk_Id);
		return ajaxDoneSuccess("成功");
	}
	
	/**
	 * 批量删除
	 * @param orderIndexs
	 * @return
	 */
	@RequestMapping("/deleteAll")
	public ModelAndView deleteAll(@RequestParam("orderIndexs") String orderIndexs) {
		if (orderIndexs != null && orderIndexs.length()> 0 ){
			String[] ids= orderIndexs.split(",");
			for( int i=0; i<ids.length; i++){
				if (ids[i].length()>0){
//					${classNameLower}Service.delete(ids[i]);
				}
			}
		}
		return ajaxDoneSuccess("成功");
	}
	
	
	/**
	 * 修改初始化
	 * 
	 * @return String
	 * @author by code generator
	 */
	@RequestMapping("/modify/{pk_Id}")
	public String initModify${className}(@PathVariable("pk_Id") String pk_Id,Model springModel) {
//		${className} ${classNameLower} = ${classNameLower}Service.get${className}ByPk(pk_Id);
//		springModel.addAttribute("infos",${classNameLower});
		return "${moduleName}/${className}/${className}Modify";
	}
	
	/**
	 * 修改
	 * 
	 * @return String
	 * @author code gen
	 */
	@RequestMapping(value="/modify${className}Action",method = RequestMethod.POST)
	public ModelAndView modify${className}(${className} model,HttpServletRequest request)  {
//		${classNameLower}Service.update(model);
		return ajaxDoneSuccess("成功");
	}
	
	/**
	 * 明细信息查找
	 * 
	 * @return String
	 * @author code gen
	 */
	@RequestMapping("/showinfo/{pk_Id}")
	public String find${className}(@PathVariable("pk_Id") String pk_Id,Model springModel)  {
//		${className} ${classNameLower} = ${classNameLower}Service.get${className}ByPk(pk_Id);
//		springModel.addAttribute("infos",${classNameLower});
		return "${moduleName}/${className}/${className}Detail";
	}
	

	

}
