package cm.web.api;

import cm.domain.User;
import cm.repository.UserRepository;
import cm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Api responsible for navigating to sign up, login and home pages
 */
@Controller
@RequestMapping("/")
public class HomeApi {

	@Autowired
	private UserService service;

    /**
     * Create user and redirect to home page
     *
     * @param user data model from UI
     * @return "signup.jsp" page name
     */
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public String signUp(@ModelAttribute User user){
		user.setRole("ROLE_USER");
		service.save(user);

		Authentication auth = new UsernamePasswordAuthenticationToken(user,
				user.getPassword(), user.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(auth);
		return "redirect:/";
	}

    /**
     * Shows sign up  page
     *
     * @return "signup.jsp" page name
     */
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public String goSignUp(){
		return "signup";
	}

    /**
     * Shows home  page
     *
     * @return "home.jsp" page name
     */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String goHome(){
		return "home";
	}

    /**
     * Shows login  page
     *
     * @return "login.jsp" page name
     */
	@RequestMapping(value = "/login", method=RequestMethod.GET)
	public String goLogin(){
		return "login";
	}
}
