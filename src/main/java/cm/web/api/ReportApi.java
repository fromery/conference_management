package cm.web.api;

import cm.domain.User;
import cm.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller()
@RequestMapping("/reports")
public class ReportApi {

	/*@Autowired
	private UserRepository userRepository;*/
	
	/*@ModelAttribute
	public User getReport(){
		return new User();
	}*/

	@RequestMapping(value="/", method= RequestMethod.GET)
	public String getReportsPage(){
		return "reports";
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