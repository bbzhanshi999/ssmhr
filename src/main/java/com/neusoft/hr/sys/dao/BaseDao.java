package com.neusoft.hr.sys.dao;

import java.util.List;

public interface BaseDao<T> {

    public  T get(T t);

    public T getById(Long id);

    public List<T> findList(T t);

    public List<T> findAll();

    public void delete(Long id);

    public void delete(T t);

    public void insert(T t);

    public void update(T t);
}
