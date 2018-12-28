package cm.web.api;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Api responsible for navigating to conference page and actions with conferences
 */
@Controller()
@RequestMapping("/conferences")
public class ConferenceApi {

    //TODO: Implementation

	/*@Autowired
	private UserRepository userRepository;*/
	
	/*@ModelAttribute
	public User getConference(){
		return new User();
	}*/

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getConferencePage() {
        return "conferences";
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

}
