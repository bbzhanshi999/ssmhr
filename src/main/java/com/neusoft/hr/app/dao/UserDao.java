package com.neusoft.hr.app.dao;

import com.neusoft.hr.app.entity.User;
import com.neusoft.hr.sys.dao.BaseDao;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2018/6/29.
 */
@Repository
public interface UserDao extends BaseDao<User> {

}
