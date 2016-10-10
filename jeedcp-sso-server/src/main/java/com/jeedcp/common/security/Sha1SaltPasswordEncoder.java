package com.jeedcp.common.security;

import com.jeedcp.common.utils.Encodes;
import org.jasig.cas.authentication.handler.DefaultPasswordEncoder;
import org.jasig.cas.authentication.handler.PasswordEncoder;

/**
 * Created by Jeedcp on 15/8/3.
 */
public class Sha1SaltPasswordEncoder implements PasswordEncoder {

    public static final int HASH_INTERATIONS = 1024;
    public static final int SALT_SIZE = 8;


    private String encodingAlgorithm;
    private String characterEncoding;

    @Override
    public String encode(String password) {
        if(password == null) {
            return null;
        } else {
            byte[] salt = Digests.generateSalt(SALT_SIZE);
            byte[] hashPassword = Digests.sha1(password.getBytes(), salt, HASH_INTERATIONS);
            return Encodes.encodeHex(salt)+ Encodes.encodeHex(hashPassword);
        }
    }

    public String getEncodingAlgorithm() {
        return encodingAlgorithm;
    }

    public void setEncodingAlgorithm(String encodingAlgorithm) {
        this.encodingAlgorithm = encodingAlgorithm;
    }

    public String getCharacterEncoding() {
        return characterEncoding;
    }

    public void setCharacterEncoding(String characterEncoding) {
        this.characterEncoding = characterEncoding;
    }

}
