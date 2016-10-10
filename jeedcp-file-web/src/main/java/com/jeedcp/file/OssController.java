package com.jeedcp.file;

import java.io.IOException;

import javax.annotation.Resource;

import com.jeedcp.oss.OssService;
import com.jeedcp.oss.bean.OssUploadResult;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;



/**
 * @author Jeedcp
 */
@Controller
public class OssController {

	@Resource(type = OssService.class)
	private OssService ossService;

	@RequestMapping(method = RequestMethod.POST, value = "/aliyun_oss_upload")
	@ResponseBody
	public OssUploadResult upload(@RequestParam("file") MultipartFile file) throws IOException {
		return ossService.upload(file);
	}

}
