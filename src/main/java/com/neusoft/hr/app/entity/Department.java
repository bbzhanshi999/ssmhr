package com.neusoft.hr.app.entity;

public class Department extends BaseEntity<Department> {

    private String departName;
    private String departCode;
    private String departType;
    private String departPhone;

    public Department(Long id, String departName){
        this.id = id;
        this.departName = departName;
    }

    public Department(){
        super();
    }

    public String getDepartName() {
        return departName;
    }

    public void setDepartName(String departName) {
        this.departName = departName;
    }



    public String getDepartType() {
        return departType;
    }

    public void setDepartType(String departType) {
        this.departType = departType;
    }

    public String getDepartPhone() {
        return departPhone;
    }

    public void setDepartPhone(String departPhone) {
        this.departPhone = departPhone;
    }

    public String getDepartCode() {
        return departCode;
    }

    public void setDepartCode(String departCode) {
        this.departCode = departCode;
    }
}
