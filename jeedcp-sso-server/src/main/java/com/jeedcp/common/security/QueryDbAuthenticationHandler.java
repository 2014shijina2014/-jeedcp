package com.jeedcp.common.security;

import com.jeedcp.common.utils.Encodes;
import org.jasig.cas.adaptors.jdbc.AbstractJdbcUsernamePasswordAuthenticationHandler;
import org.jasig.cas.authentication.HandlerResult;
import org.jasig.cas.authentication.PreventedException;
import org.jasig.cas.authentication.UsernamePasswordCredential;
import org.jasig.cas.authentication.principal.SimplePrincipal;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.IncorrectResultSizeDataAccessException;

import javax.security.auth.login.AccountNotFoundException;
import javax.security.auth.login.FailedLoginException;
import javax.validation.constraints.NotNull;
import java.security.GeneralSecurityException;
import java.util.List;

/**
 * Created by Jeedcp on 15/8/3.
 */
public class QueryDbAuthenticationHandler extends AbstractJdbcUsernamePasswordAuthenticationHandler {
    @NotNull
    private String sql;
    public static final int HASH_INTERATIONS = 1024;


    public static boolean validatePassword(String plainPassword, String password) {
        byte[] salt = Encodes.decodeHex(password.substring(0, 16));
        byte[] hashPassword = Digests.sha1(plainPassword.getBytes(), salt, HASH_INTERATIONS);
        return password.equals(Encodes.encodeHex(salt)+Encodes.encodeHex(hashPassword));
    }

    protected final HandlerResult authenticateUsernamePasswordInternal(UsernamePasswordCredential credential) throws GeneralSecurityException, PreventedException {
        String username = credential.getUsername();
        String password = credential.getPassword();

        try {
            String e = (String)this.getJdbcTemplate().queryForObject(this.sql, String.class, new Object[]{username});
            if(!validatePassword(password,e)) {
                throw new FailedLoginException("Password does not match value on record.");
            }
        } catch (IncorrectResultSizeDataAccessException var5) {
            if(var5.getActualSize() == 0) {
                throw new AccountNotFoundException(username + " not found with SQL query");
            }

            throw new FailedLoginException("Multiple records found for " + username);
        } catch (DataAccessException var6) {
            throw new PreventedException("SQL exception while executing query for " + username, var6);
        }

        return this.createHandlerResult(credential, new SimplePrincipal(username), (List)null);
    }

    public void setSql(String sql) {
        this.sql = sql;
    }
}
