package com.jeedcp.common.utils;

import com.jeedcp.common.security.Principal;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.UnavailableSecurityManagerException;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.subject.Subject;

/**
 * Created by Zach on 15/10/8.
 */
public class PrincipalUtil {


    /**
     * 获取授权主要对象
     */
    public static Subject getSubject(){
        return SecurityUtils.getSubject();
    }

    /**
     * 获取当前登录者对象
     */
    public static Principal getPrincipal(){
        try{
            Subject subject = SecurityUtils.getSubject();
            Principal principal = (Principal)subject.getPrincipal();;
            if (principal != null){
                return principal;
            }else{
                return null;
            }
//			subject.logout();
        }catch (UnavailableSecurityManagerException e) {

        }catch (InvalidSessionException e){

        }
        return null;
    }

    public static String getPrincipalId(){
        Principal principal = getPrincipal();
        if(principal != null)
            return principal.getId();
        return null;
    }
}
