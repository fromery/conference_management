package cm.service.impl;

import cm.domain.Rating;
import cm.repository.RatingRepository;
import cm.service.RatingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;

/**
 * Implementation of service for Rating entity
 */
@Service
public class RatingServiceImpl implements RatingService {   //TODO: Change implementation

    private final RatingRepository ratingRepository;

    @Autowired
    public RatingServiceImpl(RatingRepository repository) {
        this.ratingRepository = repository;
    }

    @Transactional
    public Rating save(Rating rating) {
        return ratingRepository.save(rating);
    }

    @Transactional(readOnly = true)
    public List<Rating> findAll() {
        return ratingRepository.findAll();
    }

    @Transactional(readOnly = true)
    public Rating findOne(int id) {
        Rating rating = ratingRepository.findOne(id);

        if (Objects.isNull(rating)) {
            throw new IllegalArgumentException("Not found rating: " + id);
        }

        return rating;
    }

    @Transactional
    @Override
    public void delete(int id) {
        ratingRepository.delete(findOne(id));
    }
}
