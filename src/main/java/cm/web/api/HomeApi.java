package cm.web.api;

import cm.domain.Role;
import cm.domain.User;
import cm.domain.validator.EmailExistsException;
import cm.domain.validator.UsernameExistsException;
import cm.service.UserService;
import cm.web.security.PasswordEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Api responsible for navigating to sign up, login and home pages
 */
@Controller
@RequestMapping("/")
public class HomeApi {

    private static Logger log = Logger.getLogger(HomeApi.class.getName());


    @Autowired
    private UserService userService;

    /**
     * Create user and redirect to home page
     *
     * @param user data model from UI
     * @return "signup.jsp" page name
     */
    @Transactional
    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public String signUp(@ModelAttribute("user") @Valid User user,
                         BindingResult result,
                         Model model) {

        User registered = new User();

        if (result.hasErrors()){
            log.warning("Всегда заходит");
            return "signup";
        }

        if (!result.hasErrors()) {
            registered = createUserAccount(user, Role.ROLE_USER);
        }

        //TODO: Зачем?
        if (registered == null) {
            result.rejectValue("email", "message.regError");
        }


        Authentication auth = new UsernamePasswordAuthenticationToken(user,
                user.getPassword(), user.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(auth);
        return "redirect:/";
    }

    private User createUserAccount(User account, Role role) {
        User registered = null;
        try {
            registered = userService.registerNewUserAccount(account, role);
        } catch (EmailExistsException e) {
            return null;
        } catch (UsernameExistsException e) {
            e.printStackTrace();
        }
        return registered;
    }

    /**
     * Shows sign up  page
     *
     * @return "signup.jsp" page name
     */
    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public String goSignUp(Model model) {
        model.addAttribute("user", new User());
        return "signup";
    }

    /**
     * Shows home  page
     *
     * @return "home.jsp" page name
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String goHome() {
        return "home";
    }

    /**
     * Shows login  page
     *
     * @return "login.jsp" page name
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String goLogin() {
        return "login";
    }
}
