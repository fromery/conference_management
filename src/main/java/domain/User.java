package domain;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.security.core.GrantedAuthority;

import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Collection;

@Data
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "user")
public class User extends AbstractEntity implements UserDetails {

    @NotEmpty
    @Getter(onMethod_ = {@Override})
    private String username;

    @NotEmpty
    @Getter(onMethod_ = {@Override})
    private String password;

    @NotEmpty
    @Column(name = "first_name")
    private String firstName;

    @NotEmpty
    @Column(name = "last_name")
    private String lastName;

    private boolean active;

    @NotEmpty
    @Column(name = "rating_id")
    private Integer rating_id;

    @NotEmpty
    @Column(name = "role_id")
    private Integer role_id;

    //TODO: Implement
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return null;
    }

    //TODO: Implement
    public boolean hasAuthority(String authority) {
        return getAuthorities().stream()
                .anyMatch(a -> a.getAuthority().equals(authority));
    }

    //TODO: needed?
    @Transient
    public boolean isSuperAdmin() {
        return false/*hasAuthority(AuthoritiesConstants.SUPER_ADMIN)*/;
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
        return active;
    }
}
