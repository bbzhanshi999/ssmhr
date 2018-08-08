package com.neusoft.hr.app.entity;

import com.neusoft.hr.sys.entity.BaseEntity;

public class Position extends BaseEntity<Position> {

    private static final long serialVersionUID = 1L;
    private String posName;
    private String posCode;
    private Double posSalary;

    public Position(Long posId, String posName) {
        this.id = posId;
        this.posName = posName;
    }
    public Position() {
        super();
    }


    public String getPosName() {
        return posName;
    }

    public void setPosName(String posName) {
        this.posName = posName;
    }

    public String getPosCode() {
        return posCode;
    }

    public void setPosCode(String posCode) {
        this.posCode = posCode;
    }

    public Double getPosSalary() {
        return posSalary;
    }

    public void setPosSalary(Double posSalary) {
        this.posSalary = posSalary;
    }
}
