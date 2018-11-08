package domain;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;

@Data
@Entity
@Table(name = "rating")
public class Rating {

    private Integer stars;

    private Integer quantityUsers;
}
