package com.jeeplus.modules.gen.web;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeeplus.common.persistence.Page;
import com.jeeplus.common.web.BaseController;
import com.jeeplus.modules.gen.entity.GenTemplate;
import com.jeeplus.modules.gen.service.GenTemplateService;
import com.jeeplus.modules.sys.entity.User;
import com.jeeplus.modules.sys.utils.UserUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



@Controller
@RequestMapping({"/a/gen/genTemplate"})//${adminPath}
public class GenTemplateController extends BaseController {

  @Autowired
  private GenTemplateService genTemplateService;

  @ModelAttribute
  public GenTemplate get(@RequestParam(required=false) String id){
    if (StringUtils.isNotBlank(id)) {
      return this.genTemplateService.get(id);
    }
    return new GenTemplate();
  }

  @RequiresPermissions({"gen:genTemplate:view"})
  @RequestMapping({"list", ""})
  public String list(GenTemplate genTemplate, HttpServletRequest request, HttpServletResponse response, Model model) {
    User user = UserUtils.getUser();
    if (!user.isAdmin()) {
      genTemplate.setCreateBy(user);
    }
    Page page = this.genTemplateService.find(new Page(request, response), genTemplate);
    model.addAttribute("page", page);
    return "gen/genTemplateList";
  }
  @RequiresPermissions({"gen:genTemplate:view"})
  @RequestMapping({"form"})
  public String form(GenTemplate genTemplate, Model model) {
    model.addAttribute("genTemplate", genTemplate);
    return "gen/genTemplateForm";
  }
  @RequiresPermissions({"gen:genTemplate:edit"})
  @RequestMapping({"save"})
  public String save(GenTemplate genTemplate, Model model, RedirectAttributes redirectAttributes) {
    if (!beanValidator(model, genTemplate, new Class[0])) {
      return form(genTemplate, model);
    }
    this.genTemplateService.save(genTemplate);
    addMessage(redirectAttributes, new String[] { "保存代码模板'" + genTemplate.getName() + "'成功" });
    return "redirect:/a/gen/genTemplate/?repage";
  }
  @RequiresPermissions({"gen:genTemplate:edit"})
  @RequestMapping({"delete"})
  public String delete(GenTemplate genTemplate, RedirectAttributes redirectAttributes) {
    this.genTemplateService.delete(genTemplate);
    addMessage(redirectAttributes, new String[] { "删除代码模板成功" });
    return "redirect:/a/gen/genTemplate/?repage";
  }
}