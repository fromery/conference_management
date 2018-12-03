package cm.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
import java.util.Set;
/*

@Data
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "role")
public class Role extends AbstractEntity {

    @NotEmpty
    private String code;

    @ManyToMany(mappedBy = "roles")
    private Set<User> users;
}
*/
