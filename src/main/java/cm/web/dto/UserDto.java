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
    @Size(min = 1, message = "{user.field.empty}")
    @ValidOnlyCharactersFirstLetterCapital(
            message = "{user.field.only.characters.first.letter.capital}")
    private String firstName;

    @NotNull
    @Size(min = 1, message = "{user.field.empty}")
    @ValidOnlyCharactersFirstLetterCapital(
            message = "{user.field.only.characters.first.letter.capital}")
    private String lastName;

    @NotNull
    @Size(min = 1, message = "{user.field.empty}")
    @ValidEmail(message = "{user.email.not.valid}")
    private String email;

    @NotNull
    @ValidUsername(message = "{user.username.not.valid}")
    private String username;

    @ValidPassword(message = "{user.password.not.valid}")
    private String password;

    @ValidPassword(message = "{user.password.not.valid}")
    private String matchingPassword;

    @Transient
    @AssertTrue(message = "{user.matching.password.no.match}")
    private boolean match;

    @AssertTrue
    private boolean isValid() {
        match = this.password.equals(this.matchingPassword);
        return match;
    }

    @NotEmpty(message = "{user.role.empty}")
    private String role;
}
