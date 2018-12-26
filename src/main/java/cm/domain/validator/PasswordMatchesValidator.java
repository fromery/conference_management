package cm.domain.validator;

import cm.domain.User;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class PasswordMatchesValidator  implements ConstraintValidator<PasswordMatches, Object> {

    @Override
    public void initialize(PasswordMatches passwordMatches) {

    }

    @Override
    public boolean isValid(Object o, ConstraintValidatorContext constraintValidatorContext) {
        User user = (User) o;
        return user.getPassword().equals(user.getMatchingPassword());
    }
}