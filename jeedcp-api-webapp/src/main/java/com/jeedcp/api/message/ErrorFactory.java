package com.jeedcp.api.message;

import java.lang.*;
import java.util.HashSet;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.NoSuchMessageException;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;

public class ErrorFactory {

    protected static Logger logger = LoggerFactory.getLogger(ErrorFactory.class);

    private static final String I18N_OPEN_ERROR = "i18n/open/error";
    private static final String ERROR_CODE_PREFIX = "open.error_";
    // 错误信息的国际化信息
    private static MessageSourceAccessor errorMessageSourceAccessor;
    
    /**
     * 设置国际化资源信息
     */
    public static void initMessageSource() {
        HashSet<String> baseNamesSet = new HashSet<String>();
        baseNamesSet.add(I18N_OPEN_ERROR);//ROP自动的资源

        String[] totalBaseNames = baseNamesSet.toArray(new String[0]);

        if (logger.isInfoEnabled()) {
            logger.info("加载错误码国际化资源：{}", StringUtils.arrayToCommaDelimitedString(totalBaseNames));
        }
        ResourceBundleMessageSource bundleMessageSource = new ResourceBundleMessageSource();
        bundleMessageSource.setBasenames(totalBaseNames);
        MessageSourceAccessor messageSourceAccessor = new MessageSourceAccessor(bundleMessageSource);
        setErrorMessageSourceAccessor(messageSourceAccessor);
    }

    public static java.lang.Error getError(ErrorType errorType, Locale locale, Object... params) {
        String errorMessage = getErrorMessage(ERROR_CODE_PREFIX + errorType.value(),locale,params);
        return new ErrorImpl(errorType.value(), errorMessage);
    }

    public static void setErrorMessageSourceAccessor(MessageSourceAccessor errorMessageSourceAccessor) {
        ErrorFactory.errorMessageSourceAccessor = errorMessageSourceAccessor;
    }

    private static String getErrorMessage(String code, Locale locale,Object... params) {
        try {
            Assert.notNull(errorMessageSourceAccessor, "请先设置错误消息的国际化资源");
            return errorMessageSourceAccessor.getMessage(code, params, locale);
        } catch (NoSuchMessageException e) {
            logger.error("不存在对应的错误键：{}，请检查是否在{}的错误资源", code,I18N_OPEN_ERROR);
            throw e;
        }
    }


}

