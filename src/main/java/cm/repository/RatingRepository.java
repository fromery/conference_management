package cm.repository;

import cm.domain.Rating;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Repository for rating model
 */
public interface RatingRepository extends JpaRepository<Rating, Integer> {

}
