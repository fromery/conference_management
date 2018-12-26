package cm.domain.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class UsernameValidator implements ConstraintValidator<ValidUsername, String> {
    private Pattern pattern;
    private Matcher matcher;
    private static final String USERNAME_PATTERN = ".{6,10}";

    @Override
    public void initialize(ValidUsername validUsername) {

    }

    @Override
    public boolean isValid(final String username, final ConstraintValidatorContext context) {
        return (validateUsername(username));
    }

    private boolean validateUsername(final String username) {
        pattern = Pattern.compile(USERNAME_PATTERN);
        matcher = pattern.matcher(username);
        return matcher.matches();
    }
}
