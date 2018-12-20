package cm.web.api;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * Api responsible for navigating to user page and actions with users
 */
@Controller()
@RequestMapping("/users")
public class UserApi {

	//TODO: Implementation

	/*@Autowired
	private UserRepository userRepository;*/
	
	/*@ModelAttribute
	public User getUser(){
		return new User();
	}*/

	@RequestMapping(value="/", method= RequestMethod.GET)
	public String getUsersPage(){
		return "users";
	}

	/*@ResponseBody
	@RequestMapping(value="/save", method= RequestMethod.POST)
	public List<User> saveUser(@ModelAttribute User user){

		User newUser = new User();
		newUser.setUsername("Username");
		newUser.setPassword("123456");
		userRepository.save(newUser);

		return this.userRepository.findAll();
	}*/
	
	/*@ResponseBody
	@RequestMapping("/all")
	public List<User> getUsers(){
		return this.userRepository.findAll();
	}*/

	/*@RequestMapping("/{userId}")
	public String getUser(@PathVariable("userId") Long userId, Model model){
		User user = userRepository.findOne(userId);
		model.addAttribute("user", user);
		return "user";
	}*/

	/*@RequestMapping("/top")
	public String getTopUsers(@PathVariable("userId") Long userId, Model model){
		User user = userRepository.findOne(userId);
		model.addAttribute("user", user);
		return "user";
	}*/
}
