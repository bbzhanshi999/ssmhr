package com.neusoft.hr.app.entity;

import com.neusoft.hr.sys.entity.BaseEntity;

import java.util.List;

/**
 * Created by Administrator on 2018/6/29.
 */
public class User extends BaseEntity<User> {


    private static final long serialVersionUID = 1L;
    private String username;
    private String password;
    private String phone;
    private List<String> permissions;

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

    public List<String> getPermissions() {
        return permissions;
    }

    public void setPermissions(List<String> permissions) {
        this.permissions = permissions;
    }
}
