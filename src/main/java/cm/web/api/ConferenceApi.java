package cm.web.api;

import cm.domain.User;
import cm.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller()
@RequestMapping("/conferences")
public class ConferenceApi {

	/*@Autowired
	private UserRepository userRepository;*/
	
	/*@ModelAttribute
	public User getConference(){
		return new User();
	}*/

	@RequestMapping(value="/", method= RequestMethod.GET)
	public String getConferencePage(){
		return "conferences";
	}

	/*@ResponseBody
	@RequestMapping(value="/save", method= RequestMethod.POST)
	public List<User> saveUser(@ModelAttribute User user){
		//TODO: Change Implementation
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
