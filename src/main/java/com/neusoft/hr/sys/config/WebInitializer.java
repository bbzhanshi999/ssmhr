package com.neusoft.hr.sys.config;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;

import javax.servlet.DispatcherType;
import javax.servlet.FilterRegistration;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;
import java.util.EnumSet;

public class WebInitializer implements WebApplicationInitializer {
    public void onStartup(javax.servlet.ServletContext servletContext) throws ServletException {
        AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();
        ctx.register(AppConfig.class);
        ServletRegistration.Dynamic servlet = servletContext.addServlet("dispatcher", new DispatcherServlet(ctx));
        servlet.setLoadOnStartup(1);
        servlet.addMapping("/");

        //配置encodingFilter
        FilterRegistration.Dynamic encodingFilter = servletContext.addFilter("encoding", new CharacterEncodingFilter());
        encodingFilter.setInitParameter("encoding","UTF-8");
        encodingFilter.addMappingForUrlPatterns(EnumSet.of(DispatcherType.REQUEST),true,"/*");



    }

}
