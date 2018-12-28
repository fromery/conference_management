package cm.domain.validator;

/**
 * Custom Exception. Is thrown when username already exists
 */
@SuppressWarnings("serial")
public class UsernameExistsException extends Throwable {

    public UsernameExistsException(final String message) {
        super(message);
    }
}
