package cm.web.api;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class HomeController {

	@RequestMapping(value = "/")
	public String goHome(){
		return "/home";
	}

	@RequestMapping("/registration")
	public String goRegistration(){
		return "/registration";
	}

	@RequestMapping("/login")
	public String goLogin(){
		return "/login";
	}
}
