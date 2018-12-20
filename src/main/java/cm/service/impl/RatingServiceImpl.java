package cm.service.impl;

import cm.domain.Rating;
import cm.repository.RatingRepository;
import cm.service.RatingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;

@Service
public class RatingServiceImpl implements RatingService {

    private final RatingRepository repository;

    @Autowired
    public RatingServiceImpl(RatingRepository repository) {
        this.repository = repository;
    }

    @Transactional
    @Override
    public Rating save(Rating rating) {
        return repository.save(rating);
    }

    @Transactional(readOnly = true)
    @Override
    public List<Rating> findAll() {
        return repository.findAll();
    }

    @Transactional(readOnly = true)
    @Override
    public Rating findOne(int id) {
        Rating rating = repository.findOne(id);
        if (Objects.isNull(rating)) {
            throw new IllegalArgumentException("Not found rating: " + id);
        }

        return rating;
    }

    @Transactional
    @Override
    public void delete(int id) {
        repository.delete(findOne(id));
    }
}
