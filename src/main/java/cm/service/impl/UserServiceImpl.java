package cm.service.impl;

import cm.domain.Role;
import cm.domain.User;
import cm.domain.validator.EmailExistsException;
import cm.domain.validator.UsernameExistsException;
import cm.repository.UserRepository;
import cm.service.UserService;
import cm.web.dto.UserDto;
import cm.web.errors.CustomParameterizedException;
import cm.web.mapper.UserMapper;
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

    private final UserRepository userRepository;
    private final UserMapper userMapper;

    @Autowired
    public UserServiceImpl(UserRepository repository, UserMapper userMapper) {
        this.userRepository = repository;
        this.userMapper = userMapper;
    }

    @Transactional
    public User save(User user) {
        return userRepository.save(user);
    }

    @Transactional(readOnly = true)
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Transactional(readOnly = true)
    public User findOne(int id) {
        User user = userRepository.findOne(id);
        if (Objects.isNull(user)) {
            throw new CustomParameterizedException("No such user found", (String) null);
        }

        return user;
    }

    @Transactional
    public void delete(int id) {
        User user = userRepository.findOne(id);

        if (Objects.isNull(user)) {
            throw new CustomParameterizedException("No such user found", (String) null);
        }

        userRepository.delete(findOne(id));
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

        final User user = userMapper.map(userDto);
        user.setPassword(PasswordEncoder.encode(userDto.getPassword()));
        user.setRole(role.toString());
        user.setCreatedBy(userDto.getUsername());
        user.setCreatedAt(LocalDateTime.now());

        return userRepository.save(user);
    }

    private boolean emailExist(String email) {
        User user = userRepository.findByEmail(email);
        return user != null;
    }

    private boolean usernameExist(String username) {
        User user = userRepository.findByUsername(username);
        return user != null;
    }
}
