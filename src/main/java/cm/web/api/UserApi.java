package cm.web.api;

import cm.service.UserService;
import cm.web.dto.UserDto;
import cm.web.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

/**
 * Api responsible for navigating to user page and actions with users
 */
@RestController
@RequestMapping("/api/users")
public class UserApi {

    private final UserService userService;
    private final UserMapper userMapper;

    @Autowired
    public UserApi(UserService userService, UserMapper userMapper) {
        this.userService = userService;
        this.userMapper = userMapper;
    }

    /**
     * GET api to get all users
     *
     * @return json response with a message of the operation
     */
    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public ResponseEntity<List<UserDto>> getAllUsers() {
        List<UserDto> result = userService.findAll().stream()
                .map(userMapper::map)
                .collect(Collectors.toList());

        return ResponseEntity.ok(result);
    }

}
