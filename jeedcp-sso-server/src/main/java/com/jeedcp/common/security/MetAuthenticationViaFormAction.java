package com.jeedcp.common.security;

import org.jasig.cas.authentication.Credential;
import org.jasig.cas.web.flow.AuthenticationViaFormAction;
import org.jasig.cas.web.support.WebUtils;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.util.StringUtils;
import org.springframework.webflow.core.collection.LocalAttributeMap;
import org.springframework.webflow.execution.Event;
import org.springframework.webflow.execution.RequestContext;

import javax.naming.AuthenticationException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by Zach on 15/8/4.
 */
public class MetAuthenticationViaFormAction extends AuthenticationViaFormAction {

    public final Event validatorCaptcha(final RequestContext context, final Credential credential,
                                         final MessageContext messageContext){

        final HttpServletRequest request = WebUtils.getHttpServletRequest(context);
        HttpSession session = request.getSession();
        String captcha = (String)session.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
        session.removeAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);

        MetUserCredential upc = (MetUserCredential)credential;
        String submitAuthcodeCaptcha =upc.getCaptcha();


        if(!StringUtils.hasText(submitAuthcodeCaptcha) || !StringUtils.hasText(submitAuthcodeCaptcha)){
            messageContext.addMessage(new MessageBuilder().code("required.captcha").build());
            return newEvent(AUTHENTICATION_FAILURE,new CaptchaWrongException());
        }
        if(submitAuthcodeCaptcha.equalsIgnoreCase(captcha)){
            return newEvent(SUCCESS);
        }
        messageContext.addMessage(new MessageBuilder().code("error.authentication.captcha.bad").build());
        return newEvent(AUTHENTICATION_FAILURE,new CaptchaWrongException());
    }

    private Event newEvent(final String id) {
        return new Event(this, id);
    }

    private Event newEvent(final String id, final Exception error) {
        return new Event(this, id, new LocalAttributeMap("error", error));
    }
}