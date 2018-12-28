package cm.repository;

import cm.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Repository for user model
 */
public interface UserRepository extends JpaRepository<User, Integer> {

    /**
     * @param username username of user that should be found
     * @return user by username
     */
    User findByUsername(String username);

    /**
     * @param email email of user that should be found
     * @return user by username
     */
    User findByEmail(String email);
}
