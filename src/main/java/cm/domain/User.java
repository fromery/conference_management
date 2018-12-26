package cm.domain;

import cm.domain.validator.PasswordMatches;
import cm.domain.validator.ValidEmail;
import cm.domain.validator.ValidPassword;
import cm.domain.validator.ValidUsername;
import lombok.Data;
import lombok.EqualsAndHashCode;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Collection;

/**
 * Entity bean with JPA annotations
 * Hibernate provides JPA implementation
 */
//@PasswordMatches(message = "{user.passwords.notmatch} //TODO:
@Data
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "user")
public class User extends AbstractEntity implements UserDetails {

    @NotNull
    @Size(min = 1, message = "{user.firstname.empty}")
    @Column(name = "firstName")
    private String firstName;

    @NotNull
    @Size(min = 1, message = "{user.lastname.empty}")
    @Column(name = "lastName")
    private String lastName;

    @NotNull
    @ValidEmail(message = "{user.email.notvalid}")
    @Column(name = "email")
    private String email;

    @NotNull
    @ValidUsername(message = "{user.username.notvalid}")
    @Column(name = "username")
    private String username;

    @NotNull
    //@ValidPassword(message = "{user.password.notvalid}")
    @Column(name = "password")
    private String password;

    @Transient
    private String matchingPassword;

    @NotEmpty(message = "{user.role.empty}")
    @Column(name = "role")
    private String role;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return AuthorityUtils.createAuthorityList(this.role);
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
