package com.neusoft.hr.app.entity;

import com.neusoft.hr.sys.entity.BaseEntity;

import java.util.Date;

public class EmployeeTranform extends BaseEntity<EmployeeTranform> {

  private String transType;
  private Long inDepartid;
  private Long outDepartId;
  private Long inPosId;
  private Long outPosId;
  private Long tId;
  private Date tranDate;


  public String getTransType() {
    return transType;
  }

  public void setTransType(String transType) {
    this.transType = transType;
  }

  public Long getInDepartid() {
    return inDepartid;
  }

  public void setInDepartid(Long inDepartid) {
    this.inDepartid = inDepartid;
  }

  public Long getOutDepartId() {
    return outDepartId;
  }

  public void setOutDepartId(Long outDepartId) {
    this.outDepartId = outDepartId;
  }

  public Long getInPosId() {
    return inPosId;
  }

  public void setInPosId(Long inPosId) {
    this.inPosId = inPosId;
  }

  public Long getOutPosId() {
    return outPosId;
  }

  public void setOutPosId(Long outPosId) {
    this.outPosId = outPosId;
  }

  public Long gettId() {
    return tId;
  }

  public void settId(Long tId) {
    this.tId = tId;
  }

  public Date getTranDate() {
    return tranDate;
  }

  public void setTranDate(Date tranDate) {
    this.tranDate = tranDate;
  }
}
