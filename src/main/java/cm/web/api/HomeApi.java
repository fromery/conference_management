package cm.web.api;

import cm.domain.Rating;
import cm.domain.User;
import cm.service.RatingService;
import cm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
    private UserService userService;

    @Autowired
    private RatingService ratingService;

    /**
     * Create user and redirect to home page
     *
     * @param user data model from UI
     * @return "signup.jsp" page name
     */
    @Transactional
    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public String signUp(@ModelAttribute User user) {

        //TODO: Проверить уникальность всех нужных полей пользователя через валидатор

        user.setRole("ROLE_USER");
        User createdUser = userService.save(user);

        /*Rating rating = new Rating();
        rating.setQuantityUsers(0);
        rating.setQuantityStars(0);
        rating.setUser(userService.save(user));
        ratingService.save(rating);*/

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
    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public String goSignUp() {
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
