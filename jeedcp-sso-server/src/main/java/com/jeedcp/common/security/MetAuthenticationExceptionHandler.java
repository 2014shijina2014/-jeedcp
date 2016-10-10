package com.jeedcp.common.security;

import org.jasig.cas.authentication.AuthenticationException;
import org.jasig.cas.web.flow.AuthenticationExceptionHandler;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;

/**
 * Created by Jeedcp on 15/8/4.
 *  AuthenticationExceptionHandler 处理验证码输入错误
 */
public class MetAuthenticationExceptionHandler extends AuthenticationExceptionHandler {


    /** Default message bundle prefix.
     * override 父类
     * */
    private static final String DEFAULT_MESSAGE_BUNDLE_PREFIX = "authenticationFailure.";

    //父类常亮为final ，所以override 父类handle方法
    public String handle(final AuthenticationException e, final MessageContext messageContext) {

        if(e instanceof CaptchaWrongException){
            CaptchaWrongException ce = (CaptchaWrongException)e;
            String excetionName = ce.getExceptionName();
            final String messageCode = this.DEFAULT_MESSAGE_BUNDLE_PREFIX + excetionName;
            messageContext.addMessage(new MessageBuilder().error().code(messageCode).build());
            return excetionName;
        }
        return super.handle(e,messageContext);
    }
}
