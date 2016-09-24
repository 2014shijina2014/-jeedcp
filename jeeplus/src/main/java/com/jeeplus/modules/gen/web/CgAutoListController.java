package com.jeeplus.modules.gen.web;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jeeplus.common.web.BaseController;
import com.jeeplus.modules.gen.entity.GenScheme;
import com.jeeplus.modules.gen.service.CgAutoListService;
import com.jeeplus.modules.gen.service.GenSchemeService;
import com.jeeplus.modules.gen.utils.FreemarkerHelper;
import com.jeeplus.modules.gen.utils.GenUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping({"/a/gen/cgAutoList"})//${adminPath}
public class CgAutoListController extends BaseController {

  private static Logger log = Logger.getLogger(CgAutoListController.class);

  @Autowired
  private GenSchemeService genSchemeService;


  @Autowired
  private CgAutoListService cgAutoListService;

  @ModelAttribute
  public GenScheme get(@RequestParam(required=false) String id) { if (StringUtils.isNotBlank(id)) {
      return this.genSchemeService.get(id);
    }
    return new GenScheme();
  }

  @RequestMapping({"list"})
  public void list(GenScheme genScheme, HttpServletRequest request, HttpServletResponse response){
    long start = System.currentTimeMillis();

    FreemarkerHelper viewEngine = new FreemarkerHelper();

    Map model = GenUtils.getDataModel(genScheme);

    String html = this.cgAutoListService.generateCode(genScheme);
    String findListSql = this.cgAutoListService.generateListCode(genScheme);
    try {
      response.setContentType("text/html");
      response.setHeader("Cache-Control", "no-store");
      PrintWriter writer = response.getWriter();
      writer.println(html);
      writer.flush();
    } catch (IOException e) {
      e.printStackTrace();
    }
    long end = System.currentTimeMillis();
    log.debug("动态列表生成耗时：" + (end - start) + " ms");
  }

  @RequestMapping({"test"})
  public ModelAndView list(GenScheme genScheme, HttpServletRequest request, HttpServletResponse response, Model model){
    return new ModelAndView("/gen/template/viewList");
  }
}