package cm.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;


@Data
@EqualsAndHashCode(callSuper = true)
@Entity
@Table(name = "user")
public class User extends AbstractEntity {

    /*@NotEmpty
    @Column(name = "username")*/
    private String username;

    /*@NotEmpty
    @Column(name = "password")*/
    private String password;

    //TODO: Implement
    /*@NotEmpty
    @Column(name = "firstName")*//*
    private String firstName;

    *//*@NotEmpty
    @Column(name = "lastName")*//*
    private String lastName;

    @Transient
    private String passwordConfirm;

    *//*@NotEmpty
    @Column(name = "rating_id")
    private Integer rating_id;*//*

    *//*@NotEmpty
    @Column(name = "role_id")
    private Integer role_id;*/

   /* @ManyToMany
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles;*/

}
