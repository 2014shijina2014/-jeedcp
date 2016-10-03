package com.jeedcp.gen.util;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jeedcp.common.config.Global;
import com.jeedcp.common.mapper.JaxbMapper;
import com.jeedcp.entity.sys.Office;
import com.jeedcp.gen.entity.*;
import com.jeedcp.util.DateUtils;
import com.jeedcp.util.FileUtils;
import com.jeedcp.util.FreeMarkers;
import com.jeedcp.util.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;

import java.io.*;
import java.util.List;
import java.util.Map;


public class GenUtils {

	private static Logger logger = LoggerFactory.getLogger(GenUtils.class);

	public static void initColumnField(GenTable genTable) {
		for (GenTableColumn column : genTable.getColumnList()) {
			if (StringUtils.isBlank(column.getId())) {
				continue;
			}

			if (StringUtils.isBlank(column.getComments())) {
				column.setComments(column.getName());
			}

			if ((StringUtils.endsWithIgnoreCase(column.getJdbcType(), "CHAR"))
					|| (StringUtils.endsWithIgnoreCase(column.getJdbcType(), "VARCHAR"))
					|| (StringUtils.endsWithIgnoreCase(column.getJdbcType(), "NARCHAR"))) {
				column.setJavaType("String");
			} else if ((StringUtils.endsWithIgnoreCase(column.getJdbcType(), "DATETIME"))
					|| (StringUtils.endsWithIgnoreCase(column.getJdbcType(), "DATE"))
					|| (StringUtils.endsWithIgnoreCase(column.getJdbcType(), "TIMESTAMP"))) {
				column.setJavaType("java.util.Date");
				column.setShowType("dateselect");
			} else if ((StringUtils.endsWithIgnoreCase(column.getJdbcType(), "BIGINT"))
					|| (StringUtils.endsWithIgnoreCase(column.getJdbcType(), "NUMBER"))) {
				String[] ss = StringUtils.split(StringUtils.substringBetween(column.getJdbcType(), "(", ")"), ",");
				if ((ss != null) && (ss.length == 2) && (Integer.parseInt(ss[1]) > 0)) {
					column.setJavaType("Double");
				} else if ((ss != null) && (ss.length == 1) && (Integer.parseInt(ss[0]) <= 10)) {
					column.setJavaType("Integer");
				} else {
					column.setJavaType("Long");
				}

			}

			column.setIsPk(genTable.getPkList().contains(column.getName()) ? "1" : "0");

			column.setIsInsert("1");

			if ((!StringUtils.equalsIgnoreCase(column.getName(), "id"))
					&& (!StringUtils.equalsIgnoreCase(column.getName(), "create_by"))
					&& (!StringUtils.equalsIgnoreCase(column.getName(), "create_date"))
					&& (!StringUtils.equalsIgnoreCase(column.getName(), "del_flag")))
				column.setIsEdit("1");
			else {
				column.setIsEdit("0");
			}

			if ((StringUtils.equalsIgnoreCase(column.getName(), "name"))
					|| (StringUtils.equalsIgnoreCase(column.getName(), "title"))
					|| (StringUtils.equalsIgnoreCase(column.getName(), "remarks"))
					|| (StringUtils.equalsIgnoreCase(column.getName(), "update_date")))
				column.setIsList("1");
			else {
				column.setIsList("0");
			}

			if ((StringUtils.equalsIgnoreCase(column.getName(), "name"))
					|| (StringUtils.equalsIgnoreCase(column.getName(), "title")))
				column.setIsQuery("1");
			else {
				column.setIsQuery("0");
			}

			if ((StringUtils.equalsIgnoreCase(column.getName(), "name"))
					|| (StringUtils.equalsIgnoreCase(column.getName(), "title")))
				column.setQueryType("like");
			else {
				column.setQueryType("=");
			}

			if (StringUtils.endsWithIgnoreCase(column.getName(), "user_id")) {
				column.setJavaField(column.getJavaField().replaceAll("Id", ".id|name"));
				column.setShowType("userselect");
			} else if (StringUtils.endsWithIgnoreCase(column.getName(), "office_id")) {
				column.setJavaType(Office.class.getName());
				column.setJavaField(column.getJavaField().replaceAll("Id", ".id|name"));
				column.setShowType("officeselect");
			} else if (StringUtils.endsWithIgnoreCase(column.getName(), "area_id")) {
				column.setJavaField(column.getJavaField().replaceAll("Id", ".id|name"));
				column.setShowType("areaselect");
			} else if ((StringUtils.endsWithIgnoreCase(column.getName(), "create_by"))
					|| (StringUtils.endsWithIgnoreCase(column.getName(), "update_by"))) {
				column.setJavaField(column.getJavaField() + ".id");
				column.setShowType("input");
			} else if ((StringUtils.endsWithIgnoreCase(column.getName(), "create_date"))
					|| (StringUtils.endsWithIgnoreCase(column.getName(), "update_date"))) {
				column.setShowType("dateselect");
			} else if ((StringUtils.equalsIgnoreCase(column.getName(), "remarks"))
					|| (StringUtils.equalsIgnoreCase(column.getName(), "content"))) {
				column.setShowType("textarea");
			} else if (StringUtils.equalsIgnoreCase(column.getName(), "parent_id")) {
				column.setJavaType("This");
				column.setJavaField("parent.id|name");
				column.setShowType("treeselect");
			} else if (StringUtils.equalsIgnoreCase(column.getName(), "parent_ids")) {
				column.setShowType("input");
				column.setQueryType("like");
			} else if (StringUtils.equalsIgnoreCase(column.getName(), "del_flag")) {
				column.setShowType("radiobox");
				column.setDictType("del_flag");
			} else {
				column.setShowType("input");
			}
		}
	}

	public static String getTemplatePath() {
		try {
			File file = new DefaultResourceLoader().getResource("").getFile();
			if (file != null)
				return file.getAbsolutePath() + File.separator
						+ StringUtils.replaceEach(GenUtils.class.getName(),
								new String[] { "util." + GenUtils.class.getSimpleName(), "." },
								new String[] { "template", File.separator });
		} catch (Exception e) {
			logger.error("{}", e);
		}

		return "";
	}

	@SuppressWarnings("unchecked")
	public static <T> T fileToObject(String fileName, Class<?> clazz) {
		try {
			String pathName = "/templates/modules/gen/" + fileName;

			Resource resource = new ClassPathResource(pathName);
			InputStream is = resource.getInputStream();
			BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
			StringBuilder sb = new StringBuilder();
			while (true) {
				String line = br.readLine();
				if (line == null) {
					break;
				}
				sb.append(line).append("\r\n");
			}
			if (is != null) {
				is.close();
			}
			if (br != null) {
				br.close();
			}

			return (T) JaxbMapper.fromXml(sb.toString(), clazz);
		} catch (IOException e) {
			logger.warn("Error file convert: {}", e.getMessage());
		}

		return null;
	}

	public static GenConfig getConfig() {
		return (GenConfig) fileToObject("config.xml", GenConfig.class);
	}

	public static List<GenTemplate> getTemplateList(GenConfig config, String category, boolean isChildTable) {
		List<GenTemplate> templateList = Lists.newArrayList();
		if ((config != null) && (config.getCategoryList() != null) && (category != null)) {
			for (GenCategory e : config.getCategoryList()) {
				if (category.equals(e.getValue())) {
					List<String> list = null;
					if (!isChildTable)
						list = e.getTemplate();
					else {
						list = e.getChildTableTemplate();
					}
					if (list == null)
						break;
					for (String s : list) {
						if (StringUtils.startsWith(s, GenCategory.CATEGORY_REF)) {
							templateList.addAll(getTemplateList(config,
									StringUtils.replace(s, GenCategory.CATEGORY_REF, ""), false));
						} else {
							GenTemplate template = (GenTemplate) fileToObject(s, GenTemplate.class);
							if (template != null) {
								templateList.add(template);
							}
						}
					}

					break;
				}
			}
		}
		return templateList;
	}

	@SuppressWarnings("unchecked")
	public static Map<String, Object> getDataModel(GenScheme genScheme) {
		@SuppressWarnings("rawtypes")
		Map model = Maps.newHashMap();

		model.put("packageName", StringUtils.lowerCase(genScheme.getPackageName()));
		model.put("lastPackageName", StringUtils.substringAfterLast((String) model.get("packageName"), "."));
		model.put("moduleName", StringUtils.lowerCase(genScheme.getModuleName()));
		model.put("subModuleName", StringUtils.lowerCase(genScheme.getSubModuleName()));
		model.put("className", StringUtils.uncapitalize(genScheme.getGenTable().getClassName()));
		model.put("ClassName", StringUtils.capitalize(genScheme.getGenTable().getClassName()));

		model.put("functionName", genScheme.getFunctionName());
		model.put("functionNameSimple", genScheme.getFunctionNameSimple());
		model.put("functionAuthor", StringUtils.isBlank(genScheme.getFunctionAuthor()) ? genScheme.getFunctionAuthor()
				: "jeedcp");
		model.put("functionVersion", DateUtils.getDate());

		model.put("urlPrefix",
				model.get("moduleName")
						+ (StringUtils.isBlank(genScheme.getSubModuleName())
								? "/" + StringUtils.lowerCase(genScheme.getSubModuleName()) : "")
						+ "/" + model.get("className"));
		model.put("viewPrefix", model.get("urlPrefix"));
		model.put("permissionPrefix",
				model.get("moduleName")
						+ (StringUtils.isBlank(genScheme.getSubModuleName())
								? ":" + StringUtils.lowerCase(genScheme.getSubModuleName()) : "")
						+ ":" + model.get("className"));

		model.put("dbType", Global.getConfig("jdbc.type"));

		model.put("table", genScheme.getGenTable());

		return model;
	}

	public static String generateToFile(GenTemplate tpl, Map<String, Object> model, boolean isReplaceFile) {
		String fileName = Global.getProjectPath() + File.separator
				+ StringUtils.replaceEach(
						FreeMarkers.renderString(
								new StringBuilder(String.valueOf(tpl.getFilePath())).append("/").toString(), model),
				new String[] { "//", "/", "." }, new String[] { File.separator, File.separator, File.separator })
				+ FreeMarkers.renderString(tpl.getFileName(), model);
		logger.debug(" fileName === " + fileName);

		String content = FreeMarkers.renderString(StringUtils.trimToEmpty(tpl.getContent()), model);
		logger.debug(" content === \r\n" + content);

		if (isReplaceFile) {
			FileUtils.deleteFile(fileName);
		}

		if (FileUtils.createFile(fileName)) {
			FileUtils.writeToFile(fileName, content, true);
			logger.debug(" file create === " + fileName);
			return "生成成功：" + fileName + "<br/>";
		}
		logger.debug(" file extents === " + fileName);
		return "文件已存在：" + fileName + "<br/>";
	}

	public static void main(String[] args) {
		try {
			GenConfig config = getConfig();
			System.out.println(config);
			System.out.println(JaxbMapper.toXml(config));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}