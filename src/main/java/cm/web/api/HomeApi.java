package cm.web.api;

import cm.domain.Role;
import cm.domain.User;
import cm.domain.validator.EmailExistsException;
import cm.domain.validator.UsernameExistsException;
import cm.service.UserService;
import cm.web.dto.UserDto;
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
     * @param userDto data model from UI
     * @return "signup.jsp" page name
     */
    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public String signUp(@ModelAttribute("userdto") @Valid UserDto userDto,
                         BindingResult result,
                         Model model) {

        if (result.hasErrors()) {
            return "signup";
        }

        User registered = new User();

        if (!result.hasErrors()) {

            try {
                registered = userService.registerNewUserAccount(userDto, Role.ROLE_USER);
            } catch (EmailExistsException e) {
                //result.rejectValue("email", "message.regError");
                return "signup";
            } catch (UsernameExistsException e) {
                //result.rejectValue("email", "message.regError");
                return "signup";
            }

        }

        Authentication auth = new UsernamePasswordAuthenticationToken(registered,
                registered.getPassword(), registered.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(auth);
        return "redirect:/";
    }

    /**
     * Shows sign up  page
     *
     * @return "signup.jsp" page name
     */
    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public String goSignUp(Model model) {
        model.addAttribute("userdto", new UserDto());
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
