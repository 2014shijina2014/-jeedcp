/**
 * Copyright &copy; 2015-2015  Metinform All rights reserved.
 */
package com.jeedcp.common.filter;

import net.sf.ehcache.CacheManager;
import net.sf.ehcache.constructs.web.filter.SimplePageCachingFilter;

/**
 * 页面高速缓存过滤器
 * 与spring集成
 * @author Zach Xu
 * @version 2013-8-5
 */
public class PageCachingFilter extends SimplePageCachingFilter {

    CacheManager cacheManager;

    public void setCacheManager(CacheManager cacheManager) {
        this.cacheManager = cacheManager;
    }

    @Override
	protected CacheManager getCacheManager() {
		return cacheManager;
	}
	
}
