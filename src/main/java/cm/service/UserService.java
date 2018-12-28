package cm.service;

import cm.domain.Role;
import cm.domain.User;
import cm.domain.validator.EmailExistsException;
import cm.domain.validator.UsernameExistsException;
import cm.web.dto.UserDto;

import java.util.List;

public interface UserService {

    User save(User user);

    List<User> findAll();

    User findOne(int id);

    void delete(int id);

    User registerNewUserAccount(UserDto userDto, Role role) throws EmailExistsException, UsernameExistsException;
}
