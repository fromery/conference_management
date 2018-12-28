package cm.domain.validator;

/**
 * Custom Exception. Is thrown when email already exists
 */
@SuppressWarnings("serial")
public class EmailExistsException extends Throwable {

    public EmailExistsException(final String message) {
        super(message);
    }
}
