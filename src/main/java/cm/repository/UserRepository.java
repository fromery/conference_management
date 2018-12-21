package cm.repository;

import cm.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Repository for user model
 */
public interface UserRepository extends JpaRepository<User, Integer> {

    /**
     * @param username name of user that should be found
     * @return user by username
     */
    User findByUsername(String username);
}
