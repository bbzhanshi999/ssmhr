package com.neusoft.hr.app.service;

import com.neusoft.hr.app.dao.TalentDao;
import com.neusoft.hr.app.entity.Talent;
import com.neusoft.hr.sys.service.BaseService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class TalentService extends BaseService<Talent,TalentDao> {

    public List<Map<String,Object>> statistic(String type) {
        if("department".equals(type)){
            return dao.departAmount();
        }else{
            return dao.posAmount();
        }
    }
}
