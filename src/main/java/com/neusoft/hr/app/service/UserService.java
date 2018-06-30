package com.neusoft.hr.app.service;

import com.neusoft.hr.app.dao.UserDao;
import com.neusoft.hr.app.entity.User;
import com.neusoft.hr.sys.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2018/6/29.
 */
@Service
public class UserService extends BaseService<User,UserDao> {

}
