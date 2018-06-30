package com.neusoft.hr.app.entity;

import java.util.Date;

/**
 * Created by Administrator on 2018/6/29.
 */
public class User extends BaseEntity<User> {

    private String username;
    private String password;
    private String phone;


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
