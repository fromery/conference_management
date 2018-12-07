package cm.web.api;

import cm.domain.User;
import cm.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class HomeApi {

	@Autowired
	private UserRepository repo;

	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public String signUp(@ModelAttribute User user){
		user.setRole("ROLE_USER");
		repo.save(user);

		Authentication auth = new UsernamePasswordAuthenticationToken(user,
				user.getPassword(), user.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(auth);
		return "redirect:/";
	}

	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public String goSignUp(){
		return "signup";
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String goHome(){
		return "home";
	}

	@RequestMapping(value = "/login", method=RequestMethod.GET)
	public String goLogin(){
		return "login";
	}

}
