package com.neusoft.hr.app.controller;

import com.neusoft.hr.app.entity.User;
import com.neusoft.hr.app.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@RequestMapping("/")
@Controller
public class IndexController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = {"","index","index.jsp","index.html"})
    public String index() {
        return "index";
    }

    /**
     * 登录权限验证
     *
     * @param user
     * @return
     */
    @RequestMapping(value = {"/login"})
    public String login(User user, String remember, HttpSession session, HttpServletResponse response, HttpServletRequest request) {
        User principal = userService.get(user);
        if (principal != null) {
            //通过cookie设置记住我功能
            if (StringUtils.isNotBlank(remember)) {
                Cookie usernameCookie = new Cookie("username", principal.getUsername());
                usernameCookie.setMaxAge(30 * 24 * 60 * 60 * 60);
                usernameCookie.setPath(request.getContextPath());
                response.addCookie(usernameCookie);
            }
            session.setAttribute("principal", principal);
            return "redirect:/index.html";
        } else {
            request.setAttribute("message","用户名或密码错误");
            return "forward:/login.jsp";
        }

    }


}
