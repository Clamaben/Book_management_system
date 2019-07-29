package com.zhongruan.springboot2.entity;


public class Borrower extends User {
    private String type;
    private String degree;

    public Borrower(String id, String name, String password, String type, String degree) {
        super(id, name, password);
        this.degree = degree;
        this.type = type;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public void showBasicInfo() {
        System.out.println(this.getId() + "   " + this.getName() + "   " + this.getType() + "   " + this.getDegree());
    }

}
