package cm.web.api;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class HomeApi {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String goHome(){
		return "home";
	}

	@RequestMapping(value = "/login", method=RequestMethod.GET)
	public String goLogin(){
		return "login";
	}
	@RequestMapping("signup")
	public String goRegistration(){
		return "signup";
	}

}
