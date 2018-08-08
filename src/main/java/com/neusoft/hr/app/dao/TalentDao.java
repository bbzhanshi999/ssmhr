package com.neusoft.hr.app.dao;

import com.neusoft.hr.app.entity.Talent;
import com.neusoft.hr.sys.dao.BaseDao;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface TalentDao extends BaseDao<Talent> {

    List<Map<String,Object>> departAmount();

    List<Map<String,Object>> posAmount();

}
