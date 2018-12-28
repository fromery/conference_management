package cm.domain.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Implementation of custom validator for fields with first letter capital and only characters
 */
public class OnlyCharactersFirstNameCapitalValidator implements ConstraintValidator<ValidOnlyCharactersFirstLetterCapital, String> {
    private Pattern pattern;
    private Matcher matcher;
    private static final String USERNAME_PATTERN = "^([A-Z][a-z]+)";

    @Override
    public void initialize(ValidOnlyCharactersFirstLetterCapital validOnlyCharactersFirstNameCapital) {

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
