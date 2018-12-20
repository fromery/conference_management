package cm.service.impl;

import cm.domain.User;
import cm.repository.UserRepository;
import cm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository repository;

    @Autowired
    public UserServiceImpl(UserRepository repository) {
        this.repository = repository;
    }

    @Transactional
    @Override
    public User save(User user) {
        return repository.save(user);
    }

    @Transactional(readOnly = true)
    @Override
    public List<User> findAll() {
        return repository.findAll();
    }

    @Transactional(readOnly = true)
    @Override
    public User findOne(int id) {
        User user = repository.findOne(id);
        if (Objects.isNull(user)) {
            throw new IllegalArgumentException("Not found user: " + id);
        }

        return user;
    }

    @Transactional
    @Override
    public void delete(int id) {
        repository.delete(findOne(id));
    }
}
