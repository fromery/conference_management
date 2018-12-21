package cm.domain;

import lombok.Data;

import javax.persistence.*;

/**
 * Entity bean with JPA annotations
 * Hibernate provides JPA implementation
 */
@Data
@Entity
@Table(name = "rating")
public class Rating {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "quantity_stars")
    private Integer quantityStars;

    @Column(name = "quantity_users")
    private Integer quantityUsers;

    @OneToOne(mappedBy = "rating", cascade = CascadeType.ALL,
            fetch = FetchType.LAZY, optional = false)
    private User user;
}
