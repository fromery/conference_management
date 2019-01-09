package cm.web.api;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * Api responsible for navigating to report page and actions with reports
 */
@Controller()
@RequestMapping("/reports")
public class ReportApi {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getReportsPage() {
        return "reports";
    }

}
