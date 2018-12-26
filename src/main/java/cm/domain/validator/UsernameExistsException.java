package cm.domain.validator;

@SuppressWarnings("serial")
public class UsernameExistsException extends Throwable {

    public UsernameExistsException(final String message) {
        super(message);
    }
}
