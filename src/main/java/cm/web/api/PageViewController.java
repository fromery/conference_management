package cm.web.api;

import cm.domain.Role;
import cm.domain.User;
import cm.domain.validator.EmailExistsException;
import cm.domain.validator.UsernameExistsException;
import cm.service.UserService;
import cm.web.dto.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;
import java.util.logging.Logger;

/**
 * Api responsible for navigating to all pages
 */
@Controller
@RequestMapping("/")
public class PageViewController {

    private static Logger log = Logger.getLogger(PageViewController.class.getName());

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
                         BindingResult result) {

        if (result.hasErrors()) {
            return "signup";
        }

        User registered = new User();

        if (!result.hasErrors()) {

            try {
                registered = userService.registerNewUserAccount(userDto, Role.ROLE_USER);
            } catch (EmailExistsException e) {
                result.rejectValue("email", "user.email.already.exists",
                        "Account for that email already exists. Please enter a different email."); //TODO: user.email.alreadyexists doesn't see bundle
                return "signup";
            } catch (UsernameExistsException e) {
                result.rejectValue("username", "user.username.already.exists",
                        "Account for that username already exists. Please enter a different email.");//TODO: user.email.alreadyexists doesn't see bundle
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

    /**
     * Shows user page
     *
     * @return users.jsp page
     */
    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String getUsersPage() {
        return "users";
    }

    /**
     * Shows conference page
     *
     * @return conferences.jsp page
     */
    @RequestMapping(value = "/conferences", method = RequestMethod.GET)
    public String getConferencePage() {
        return "conferences";
    }

    /**
     * Shows report page
     *
     * @return reports.jsp page
     */
    @RequestMapping(value = "/reports", method = RequestMethod.GET)
    public String getReportsPage() {
        return "reports";
    }
}
