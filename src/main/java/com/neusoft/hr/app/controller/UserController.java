package com.neusoft.hr.app.controller;

import com.neusoft.hr.app.entity.User;
import com.neusoft.hr.app.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by Administrator on 2018/6/29.
 */
@RequestMapping("/user")
@RestController
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("{id}")
    public User user(@PathVariable String id){
        return userService.getById(1L);
    }
}
