package com.jeedcp.api.message;

import java.util.EnumMap;

public enum ErrorType {
	INVALID_METHOD, // 请求不存在
	INVALID_ARGUMENTS, // 参数验证错误
	MISSING_APP_KEY, // 缺少appId
	INVALID_APP_KEY, // appId错误
	MISSING_SIGNATURE, // 缺少数字签名
	INVALID_SIGNATURE, // 数字签名错误
	REQEST_TIMEOUT,// 请求超时
    BUSINESS_LOGIC_ERROR // 业务错误
    ,SERVICE_CURRENTLY_UNAVAILABLE // 服务不可用
    ; 

    private static EnumMap<ErrorType, String> errorCodeMap = new EnumMap<ErrorType, String>(ErrorType.class);

    static {
    	errorCodeMap.put(ErrorType.INVALID_METHOD, "1");
    	errorCodeMap.put(ErrorType.INVALID_ARGUMENTS, "2");
        errorCodeMap.put(ErrorType.MISSING_APP_KEY, "3");
        errorCodeMap.put(ErrorType.INVALID_APP_KEY, "4");
        errorCodeMap.put(ErrorType.MISSING_SIGNATURE, "5");
        errorCodeMap.put(ErrorType.INVALID_SIGNATURE, "6");
        errorCodeMap.put(ErrorType.REQEST_TIMEOUT, "7");
        errorCodeMap.put(ErrorType.BUSINESS_LOGIC_ERROR, "8");
        errorCodeMap.put(ErrorType.SERVICE_CURRENTLY_UNAVAILABLE, "9");
    }

    public String value() {
        return errorCodeMap.get(this);
    }
}

