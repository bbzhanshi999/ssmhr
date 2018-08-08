package com.neusoft.hr.sys.dao;

import com.neusoft.hr.sys.entity.Page;

import java.util.List;

public interface BaseDao<T> {

    public  T get(T t);

    public T getById(Long id);

    public List<T> findList(T t);

    public List<T> getPage(Page<T> page);

    public List<T> findAll();

    public void delete(Long id);

    public void delete(T t);

    public void insert(T t);

    public void update(T t);

    public Integer totalCount(Page<T> page);
}
