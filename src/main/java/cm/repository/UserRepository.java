package cm.repository;

import cm.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Repository for user model
 */
public interface UserRepository extends JpaRepository<User, Long> {

    /**
     * Find user by given name
     *
     * @param username name of user that should be found
     * @return user by username
     */
    User findByUsername(String username);
}
