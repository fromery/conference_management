package cm.web.security;

import org.springframework.security.crypto.password.StandardPasswordEncoder;

/**
 * Implements user password encoding
 */
public class PasswordEncoder {

    public static String encode(String password) {
        StandardPasswordEncoder encoder = new StandardPasswordEncoder();
        return encoder.encode(password);
    }
}
