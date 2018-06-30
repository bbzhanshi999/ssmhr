package com.neusoft.hr.sys.service;

import com.neusoft.hr.app.entity.BaseEntity;
import com.neusoft.hr.sys.dao.BaseDao;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class BaseService <E extends BaseEntity<E>,D extends BaseDao<E>> {

    @Autowired
    protected D dao;

    public E get(E e){
        return dao.get(e);
    }

    public E getById(Long id){
        return  dao.getById(id);
    }

    public List<E> findList(E e){
        return dao.findList(e);
    }

    public List<E> findAll(){
        return dao.findAll();
    }

    public void delete(Long id){
        dao.delete(id);
    }

    public void delete(E e){
        dao.delete(e);
    }

    public void save(E e){
        if(e.getId()!=null){
            dao.insert(e);
        }else{
            dao.update(e);
        }
    }


}
