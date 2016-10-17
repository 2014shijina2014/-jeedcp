/**
 * Copyright &copy; 2015-2015  Metinform All rights reserved.
 */
package com.jeedcp.modules.cms.service;

import com.jeedcp.common.service.CrudService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeedcp.modules.cms.dao.ArticleDataDao;
import com.jeedcp.modules.cms.entity.ArticleData;

/**
 * 站点Service
 * @author Zach Xu
 * @version 2013-01-15
 */
@Service
@Transactional(readOnly = true)
public class ArticleDataService extends CrudService<ArticleDataDao, ArticleData> {

}
