package cm.web.api;

import cm.domain.User;
import cm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Api responsible for navigating to user page and actions with users
 */
@Controller
@RequestMapping("/users")
public class UserApi {

	@Autowired
	private UserService userService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getUsersPage() {
        return "users";
    }
	
	@ResponseBody
	@RequestMapping("/all")
	public List<User> getUsers(){
		return this.userService.findAll();
	}

}
