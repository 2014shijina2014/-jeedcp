package com.jeeplus.modules.gen.web;


import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeeplus.common.persistence.Page;
import com.jeeplus.common.web.BaseController;
import com.jeeplus.modules.gen.entity.GenScheme;
import com.jeeplus.modules.gen.entity.GenTable;
import com.jeeplus.modules.gen.entity.GenTableColumn;
import com.jeeplus.modules.gen.service.GenSchemeService;
import com.jeeplus.modules.gen.service.GenTableService;
import com.jeeplus.modules.gen.utils.GenUtils;
import com.jeeplus.modules.sys.entity.User;
import com.jeeplus.modules.sys.utils.UserUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



@Controller
@RequestMapping({"${adminPath}/gen/genTable"})
public class GenTableController extends BaseController {

  @Autowired
  private GenTableService genTableService;

  @Autowired
  private GenSchemeService genSchemeService;

  public GenTable get(GenTable genTable){
    if (StringUtils.isNotBlank(genTable.getId())) {
      return this.genTableService.get(genTable.getId());
    }
    return genTable;
  }

  @RequiresPermissions({"gen:genTable:list"})
  @RequestMapping({"list", ""})
  public String list(GenTable genTable, HttpServletRequest request, HttpServletResponse response, Model model) {
    genTable = get(genTable);
    User user = UserUtils.getUser();
    if (!user.isAdmin()) {
      genTable.setCreateBy(user);
    }
    Page page = this.genTableService.find(new Page(request, response), genTable);
    model.addAttribute("page", page);
    return "modules/gen/genTableList";
  }
  @RequiresPermissions(value={"gen:genTable:view", "gen:genTable:add", "gen:genTable:edit"}, logical=Logical.OR)
  @RequestMapping({"form"})
  public String form(GenTable genTable, Model model) {
    genTable = get(genTable);
    model.addAttribute("genTable", genTable);
    model.addAttribute("config", GenUtils.getConfig());
    model.addAttribute("tableList", this.genTableService.findAll());
    return "modules/gen/genTableForm";
  }

  @RequiresPermissions(value={"gen:genTable:add", "gen:genTable:edit"}, logical=Logical.OR)
  @RequestMapping({"save"})
  public String save(GenTable genTable, Model model, RedirectAttributes redirectAttributes) {
    if (!beanValidator(model, genTable, new Class[0])) {
      return form(genTable, model);
    }

    if ((StringUtils.isBlank(genTable.getId())) && (!this.genTableService.checkTableName(genTable.getName()))) {
      addMessage(redirectAttributes, new String[] { "添加失败！" + genTable.getName() + " 记录已存在！" });
      return "redirect:/a/gen/genTable/?repage";
    }

    if ((StringUtils.isBlank(genTable.getId())) && (!this.genTableService.checkTableNameFromDB(genTable.getName()))) {
      addMessage(redirectAttributes, new String[] { "添加失败！" + genTable.getName() + "表已经在数据库中存在,请从数据库导入表单！" });
      return "redirect:/a/gen/genTable/?repage";
    }

    this.genTableService.save(genTable);
    addMessage(redirectAttributes, new String[] { "保存业务表'" + genTable.getName() + "'成功" });
    return "redirect:/a/gen/genTable/?repage";
  }

  @RequiresPermissions({"gen:genTable:importDb"})
  @RequestMapping({"importTableFromDB"})
  public String importTableFromDB(GenTable genTable, Model model, RedirectAttributes redirectAttributes) {
    genTable = get(genTable);
    if (!StringUtils.isBlank(genTable.getName()))
    {
      if (!this.genTableService.checkTableName(genTable.getName())) {
        addMessage(redirectAttributes, new String[] { "下一步失败！" + genTable.getName() +
          " 表已经添加！" });
        return "redirect:/a/gen/genTable/?repage";
      }

      genTable = this.genTableService.getTableFormDb(genTable);
      genTable.setTableType("0");
      this.genTableService.saveFromDB(genTable);
      addMessage(redirectAttributes, new String[] { "数据库导入表单'" + genTable.getName() +
        "'成功" });
      return "redirect:/a/gen/genTable/?repage";
    }

    List tableList = this.genTableService.findTableListFormDb(new GenTable());
    model.addAttribute("tableList", tableList);
    model.addAttribute("config", GenUtils.getConfig());
    return "modules/gen/importTableFromDB";
  }

  @RequiresPermissions({"gen:genTable:del"})
  @RequestMapping({"delete"})
  public String delete(GenTable genTable, RedirectAttributes redirectAttributes) {
    genTable = get(genTable);
    this.genTableService.delete(genTable);
    this.genSchemeService.delete(this.genSchemeService.findUniqueByProperty("gen_table_id", genTable.getId()));
    addMessage(redirectAttributes, new String[] { "移除业务表记录成功" });
    return "redirect:" + this.adminPath + "/gen/genTable/?repage";
  }
  @RequiresPermissions({"gen:genTable:del"})
  @RequestMapping({"deleteDb"})
  public String deleteDb(GenTable genTable, RedirectAttributes redirectAttributes) {
    genTable = get(genTable);
    this.genTableService.delete(genTable);
    this.genSchemeService.delete(this.genSchemeService.findUniqueByProperty("gen_table_id", genTable.getId()));
    StringBuffer sql = new StringBuffer();
    sql.append("drop table if exists " + genTable.getName() + " ;");
    this.genTableService.buildTable(sql.toString());
    addMessage(redirectAttributes, new String[] { "删除业务表记录和数据库表成功" });
    return "redirect:/a/gen/genTable/?repage";
  }
  @RequiresPermissions({"gen:genTable:del"})
  @RequestMapping({"deleteAll"})
  public String deleteAll(String ids, RedirectAttributes redirectAttributes) {
    String[] idArray = ids.split(",");
    for (String id : idArray) {
      this.genTableService.delete(this.genTableService.get(id));
    }
    addMessage(redirectAttributes, new String[] { "删除业务表成功" });
    return "redirect:/a/gen/genTable/?repage";
  }

  @RequiresPermissions({"gen:genTable:synchDb"})
  @RequestMapping({"synchDb"})
  public String synchDb(GenTable genTable, RedirectAttributes redirectAttributes) {
    genTable = get(genTable);
    StringBuffer sql = new StringBuffer();
    List<GenTableColumn> getTableColumnList = genTable.getColumnList();
    sql.append("drop table if exists " + genTable.getName() + " ;");
    this.genTableService.buildTable(sql.toString());
    sql = new StringBuffer();
    sql.append("create table " + genTable.getName() + " (");
    String pk = "";
    for (GenTableColumn column : getTableColumnList) {
      if (column.getIsPk().equals("1")) {
        sql.append("  " + column.getName() + " " + column.getJdbcType() + " comment '" + column.getComments() + "',");
        pk = pk + column.getName() + ",";
      }
      else {
        sql.append("  " + column.getName() + " " + column.getJdbcType() + " comment '" + column.getComments() + "',");
      }
    }

    sql.append("primary key (" + pk.substring(0, pk.length() - 1) + ") ");
    sql.append(") comment '" + genTable.getComments() + "'");
    this.genTableService.buildTable(sql.toString());
    this.genTableService.syncSave(genTable);
    addMessage(redirectAttributes, new String[] { "强制同步数据库表成功" });
    return "redirect:/a/gen/genTable/?repage";
  }

  @RequiresPermissions({"gen:genTable:genCode"})
  @RequestMapping({"genCodeForm"})
  public String genCodeForm(GenScheme genScheme, Model model, RedirectAttributes redirectAttributes) {
    if (StringUtils.isBlank(genScheme.getPackageName())) {
      genScheme.setPackageName("com.jeeplus.modules");
    }
    GenScheme oldGenScheme = this.genSchemeService.findUniqueByProperty("gen_table_id", genScheme.getGenTable().getId());
    if (oldGenScheme != null) {
      genScheme = oldGenScheme;
    }
    model.addAttribute("genScheme", genScheme);
    model.addAttribute("config", GenUtils.getConfig());
    model.addAttribute("tableList", this.genTableService.findAll());
    return "modules/gen/genCodeForm";
  }

  @RequestMapping({"genCode"})
  public String genCode(GenScheme genScheme, Model model, RedirectAttributes redirectAttributes){
    String result = this.genSchemeService.save(genScheme);
    addMessage(redirectAttributes, new String[] { genScheme.getGenTable().getName() + "代码生成成功<br/>" + result });
    return "redirect:/a/gen/genTable/?repage";
  }
}