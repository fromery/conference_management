package cm.service;

import cm.domain.User;

import java.util.List;

public interface UserService {

    User save(User user);

    List<User> findAll();

    User findOne(int id);

    void delete(int id);

}
