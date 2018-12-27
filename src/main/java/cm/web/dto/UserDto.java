package cm.web.dto;

import cm.domain.validator.*;
import lombok.Data;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.Transient;
import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * DTO for user entity with validation
 */
@Data
public class UserDto {

    @NotNull
    @Size(min = 1, message = "{user.firstname.empty}")
    private String firstName;

    @NotNull
    @Size(min = 1, message = "{user.lastname.empty}")
    private String lastName;

    @NotNull
    @ValidEmail(message = "{user.email.notvalid}")
    private String email;

    @NotNull
    @ValidUsername(message = "{user.username.notvalid}")
    private String username;

    @ValidPassword(message = "{user.password.notvalid}")
    private String password;

    @ValidPassword(message = "{user.password.notvalid}")
    private String matchingPassword;

    @Transient
    @AssertTrue(message = "{user.matchingpassword.nonmatch}")
    private boolean match;

    @AssertTrue
    private boolean isValid() {
        match = this.password.equals(this.matchingPassword);
        return match;
    }

    @NotEmpty(message = "{user.role.empty}")
    private String role;
}
