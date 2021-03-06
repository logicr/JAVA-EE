package club.logicr.myweb.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * @author Jan on 2018/8/7.
 * @version 1.0
 */
@Controller
@RequestMapping
public class LogoutSpringMvc {

    @RequestMapping(value = {"/logout"},method = {RequestMethod.GET})
    public String logout(
            HttpSession session
    ){
        session.removeAttribute("current_user");
        return "video";
    }
}
