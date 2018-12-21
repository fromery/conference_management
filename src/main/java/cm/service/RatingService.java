package cm.service;

import cm.domain.Rating;

import java.util.List;

/**
 * Service Interface for managing Rating.
 */
public interface RatingService {

    Rating save(Rating rating);

    List<Rating> findAll();

    Rating findOne(int id);

    void delete(int id);

}
