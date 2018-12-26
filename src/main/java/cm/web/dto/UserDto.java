package cm.web.dto;

import cm.domain.validator.PasswordMatches;
import cm.domain.validator.ValidEmail;
import cm.domain.validator.ValidPassword;
import cm.domain.validator.ValidUsername;
import lombok.Data;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.Column;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * DTO for user entity
 */
//@PasswordMatches(message = "{user.passwords.notmatch}")
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

    private String matchingPassword;

    //@NotEmpty(message = "{user.role.empty}")
    @Column(name = "role")
    private String role;
}
