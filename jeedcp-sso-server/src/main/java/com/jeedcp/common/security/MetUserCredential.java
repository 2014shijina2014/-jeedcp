package com.jeedcp.common.security;

import org.jasig.cas.authentication.RememberMeUsernamePasswordCredential;
import org.jasig.cas.authentication.UsernamePasswordCredential;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * Created by Zach on 15/8/4.
 */
public class MetUserCredential extends RememberMeUsernamePasswordCredential {

    private static final long serialVersionUID = -2988130322912201986L;
    @NotNull
    @Size(min=1,message = "required.captcha")
    private String captcha;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getCaptcha() {
        return captcha;
    }

    public void setCaptcha(String captcha) {
        this.captcha = captcha;
    }
}
