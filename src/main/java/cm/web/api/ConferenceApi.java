package cm.web.api;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Api responsible for navigating to conference page and actions with conferences
 */
@Controller
@RequestMapping("/conferences")
public class ConferenceApi {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getConferencePage() {
        return "conferences";
    }

}
