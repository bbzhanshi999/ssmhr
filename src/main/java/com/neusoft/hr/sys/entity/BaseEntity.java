package com.neusoft.hr.sys.entity;

import java.util.Date;

/**
 * Created by Administrator on 2018/6/29.
 */
public class BaseEntity<T> {

    protected Long id;
    protected String delFlag;
    protected  Date createTime;

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }
}
