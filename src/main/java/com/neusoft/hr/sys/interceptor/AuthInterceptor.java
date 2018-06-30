package com.neusoft.hr.sys.interceptor;


import com.neusoft.hr.app.entity.User;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 登录权限控制拦截器
 */
public class AuthInterceptor  extends HandlerInterceptorAdapter {

    /**
     * 权限拦截器，检查是否有session，以及session是否存在user对象来确定是否登录，如果未登录，就返回到登录页面
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        //判断是否登录
        System.out.println(request.getRequestURI());
        HttpSession session = request.getSession(false);
        if(session!=null){
            User principal = (User) session.getAttribute("principal");
            if(principal!=null){
                return true;
            }
            session.invalidate();
        }
        response.sendRedirect(request.getContextPath()+"/login.jsp");
        return  false;
    }
}
