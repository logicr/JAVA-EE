package club.logicr.myweb.control;

import club.logicr.myweb.entity.User;
import club.logicr.myweb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author Jan on 2018/8/4.
 * @version 1.0
 */
@Controller
@RequestMapping
public class LoginSpringMVC {
    @Autowired
    private UserService userService;
    /*业务逻辑：将传入的帐号和密码存入到数据库中*/
    @RequestMapping(value = {"/userLogin"}, method = {RequestMethod.POST})

    /*用注解代替HttpServlet*/
    public ModelAndView loginMysql(
            @RequestParam("username") String username,
            @RequestParam("password" ) String password,
            HttpSession session
                                   ) {
        ModelAndView modelAndView = new ModelAndView();
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        if (null == username || null == password ||username.length() ==0 || password.length()==0) {
            modelAndView.addObject("error", "用户名或密码为空");
        }else if(userService.login(user)) {
            session.setAttribute("current_user",username);
            modelAndView.setViewName("video");
            return modelAndView;
        }else {
            modelAndView.addObject("error", "用户名或密码错误");
        }
        modelAndView.setViewName("login");
        return modelAndView;
    }
}
