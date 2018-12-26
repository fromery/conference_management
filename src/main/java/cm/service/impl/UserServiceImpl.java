package cm.service.impl;

import cm.domain.Role;
import cm.domain.User;
import cm.domain.validator.EmailExistsException;
import cm.domain.validator.UsernameExistsException;
import cm.repository.UserRepository;
import cm.service.UserService;
import cm.web.security.PasswordEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.method.P;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.Arrays;
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

    @Override
    public User registerNewUserAccount(User account, Role role) throws EmailExistsException, UsernameExistsException {

        //TODO: Проверка на уникальность email проверить
//        if (emailExist(account.getEmail())) {
//            throw new EmailExistsException(
//                    "There is an account with that email address:"  + account.getEmail());
//        }
        //TODO: Проверка на уникальность username проверить
//        if(usernameExist(account.getUsername())){
//            throw new UsernameExistsException(
//                    "There is an account with that username:"  + account.getUsername());
//        }

        account.setRole(role.toString());
        account.setPassword(PasswordEncoder.encode(account.getPassword()));
        account.setCreatedBy(account.getUsername());
        account.setCreatedAt(LocalDateTime.now());
        return repository.save(account);
    }

    private boolean emailExist(String email) {
        User user = repository.findByEmail(email);
        if (user != null) {
            return true;
        }
        return false;
    }

    private boolean usernameExist(String username) {
        User user = repository.findByUsername(username);
        if (user != null) {
            return true;
        }
        return false;
    }
}
