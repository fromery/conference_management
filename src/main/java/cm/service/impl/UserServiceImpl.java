package cm.service.impl;

import cm.domain.Role;
import cm.domain.User;
import cm.domain.validator.EmailExistsException;
import cm.domain.validator.UsernameExistsException;
import cm.repository.UserRepository;
import cm.service.UserService;
import cm.web.dto.UserDto;
import cm.web.security.PasswordEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

import java.util.List;
import java.util.Objects;

/**
 * Implementation of service for User entity
 */
@Service
public class UserServiceImpl implements UserService {

    private final UserRepository repository;

    @Autowired
    public UserServiceImpl(UserRepository repository) {
        this.repository = repository;
    }

    @Transactional
    public User save(User user) {
        return repository.save(user);
    }

    @Transactional(readOnly = true)
    public List<User> findAll() {
        return repository.findAll();
    }

    @Transactional(readOnly = true)
    public User findOne(int id) {
        User user = repository.findOne(id);
        if (Objects.isNull(user)) {
            throw new IllegalArgumentException("Not found user: " + id);
        }

        return user;
    }

    @Transactional
    public void delete(int id) {
        repository.delete(findOne(id));
    }

    @Transactional
    public User registerNewUserAccount(UserDto userDto, Role role) throws EmailExistsException, UsernameExistsException {

        if (emailExist(userDto.getEmail())) {
            throw new EmailExistsException(
                    "There is an account with that email address:" + userDto.getEmail());
        }
        if (usernameExist(userDto.getUsername())) {
            throw new UsernameExistsException(
                    "There is an account with that username:" + userDto.getUsername());
        }
        final User user = new User();

        user.setFirstName(userDto.getFirstName());
        user.setLastName(userDto.getLastName());
        user.setEmail(userDto.getEmail());
        user.setUsername(userDto.getUsername());
        user.setPassword(PasswordEncoder.encode(userDto.getPassword()));
        user.setRole(role.toString());
        user.setCreatedBy(userDto.getUsername());
        user.setCreatedAt(LocalDateTime.now());

        return repository.save(user);
    }

    private boolean emailExist(String email) {
        User user = repository.findByEmail(email);
        return user != null;
    }

    private boolean usernameExist(String username) {
        User user = repository.findByUsername(username);
        return user != null;
    }
}
