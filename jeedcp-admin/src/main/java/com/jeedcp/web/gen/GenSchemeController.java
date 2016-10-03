package com.jeedcp.web.gen;



import com.jeedcp.common.model.Page;
import com.jeedcp.entity.sys.User;
import com.jeedcp.gen.entity.GenScheme;
import com.jeedcp.gen.sevice.GenSchemeService;
import com.jeedcp.gen.sevice.GenTableService;
import com.jeedcp.gen.util.GenUtils;
import com.jeedcp.service.util.UserUtils;
import com.jeedcp.web.base.BaseController;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@Controller
@RequestMapping({"/a/gen/genScheme"})//${adminPath}
public class GenSchemeController extends BaseController {

  @Autowired
  private GenSchemeService genSchemeService;

  @Autowired
  private GenTableService genTableService;

  @ModelAttribute
  public GenScheme get(@RequestParam(required=false) String id){
    if (StringUtils.isNotBlank(id)) {
      return this.genSchemeService.get(id);
    }
    return new GenScheme();
  }

  @RequiresPermissions({"gen:genScheme:view"})
  @RequestMapping({"list", ""})
  public String list(GenScheme genScheme, HttpServletRequest request, HttpServletResponse response, Model model) {
    User user = UserUtils.getUser();
    if (!user.isAdmin()) {
      genScheme.setCreateBy(user);
    }
    Page page = this.genSchemeService.find(new Page(request, response), genScheme);
    model.addAttribute("page", page);

    return "/gen/genSchemeList";
  }
  @RequiresPermissions({"gen:genScheme:view"})
  @RequestMapping({"form"})
  public String form(GenScheme genScheme, Model model) {
    if (StringUtils.isBlank(genScheme.getPackageName())) {
      genScheme.setPackageName("com.bjxiaowen.modules");
    }

    model.addAttribute("genScheme", genScheme);
    model.addAttribute("config", GenUtils.getConfig());
    model.addAttribute("tableList", this.genTableService.findAll());
    return "modules/gen/genSchemeForm";
  }
  @RequiresPermissions({"gen:genScheme:edit"})
  @RequestMapping({"save"})
  public String save(GenScheme genScheme, Model model, RedirectAttributes redirectAttributes) {
    if (!beanValidator(model, genScheme, new Class[0])) {
      return form(genScheme, model);
    }

    String result = this.genSchemeService.save(genScheme);
    addMessage(redirectAttributes, new String[] { "操作生成方案'" + genScheme.getName() + "'成功<br/>" + result });
    return "redirect:/a/gen/genScheme/?repage";
  }
  @RequiresPermissions({"gen:genScheme:edit"})
  @RequestMapping({"delete"})
  public String delete(GenScheme genScheme, RedirectAttributes redirectAttributes) {
    this.genSchemeService.delete(genScheme);
    addMessage(redirectAttributes, new String[] { "删除生成方案成功" });
    return "redirect:/a/gen/genScheme/?repage";
  }
}