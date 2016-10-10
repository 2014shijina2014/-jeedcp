package com.jeedcp.common.security;


import org.jasig.cas.authentication.AuthenticationException;

/**
 * Created by Zach on 15/8/4.
 */
public class CaptchaWrongException extends AuthenticationException {

    private final String exceptionName = "CaptchaWrongException";

    public String getExceptionName() {
        return exceptionName;
    }

}
