/**
 * Copyright &copy; 2015-2015  Metinform All rights reserved.
 */
package com.jeedcp.modules.gen.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeedcp.common.persistence.Pagination;
import com.jeedcp.common.utils.StringUtils;
import com.jeedcp.common.web.BaseController;
import com.jeedcp.modules.gen.entity.GenTemplate;
import com.jeedcp.modules.gen.sevice.GenTemplateService;
import com.jeedcp.modules.gen.entity.GenTemplate;
import com.jeedcp.modules.gen.sevice.GenTemplateService;
import com.jeedcp.modules.sys.entity.User;
import com.jeedcp.modules.sys.utils.CurrentUserUtils;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



/**
 * 代码模板Controller
 * @author jeedcp
 * @version 2013-10-15
 */
@Controller
@RequestMapping(value = "${adminPath}/gen/genTemplate")
public class GenTemplateController extends BaseController {

	@Autowired
	private GenTemplateService genTemplateService;
	
	@ModelAttribute
	public GenTemplate get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return genTemplateService.get(id);
		}else{
			return new GenTemplate();
		}
	}
	
	@RequiresPermissions("gen:genTemplate:view")
	@RequestMapping(value = {"list", ""})
	public String list(GenTemplate genTemplate, HttpServletRequest request, HttpServletResponse response, Model model) {
		User user = CurrentUserUtils.getUser();
		if (!user.isAdmin()){
			genTemplate.setCreateBy(user.getId());
		}
        Pagination<GenTemplate> page = genTemplateService.find(new Pagination<GenTemplate>(request, response), genTemplate);
        model.addAttribute("page", page);
		return "modules/gen/genTemplateList";
	}

	@RequiresPermissions("gen:genTemplate:view")
	@RequestMapping(value = "form")
	public String form(GenTemplate genTemplate, Model model) {
		model.addAttribute("genTemplate", genTemplate);
		return "modules/gen/genTemplateForm";
	}

	@RequiresPermissions("gen:genTemplate:edit")
	@RequestMapping(value = "save")
	public String save(GenTemplate genTemplate, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, genTemplate)){
			return form(genTemplate, model);
		}
		genTemplateService.save(genTemplate);
		addMessage(redirectAttributes, "保存代码模板'" + genTemplate.getName() + "'成功");
		return "redirect:" + adminPath + "/gen/genTemplate/";
	}
	
	@RequiresPermissions("gen:genTemplate:edit")
	@RequestMapping(value = "delete")
	public String delete(GenTemplate genTemplate, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		genTemplateService.delete(genTemplate);
		addMessage(redirectAttributes, "删除代码模板成功");
        String no = request.getParameter("pageNum");
		return "redirect:" + adminPath + "/gen/genTemplate/?pageNum="+no;
	}

}
