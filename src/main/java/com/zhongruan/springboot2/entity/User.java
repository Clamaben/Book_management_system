// 借阅者、图书管理员、系统管理员类的父类
package com.zhongruan.springboot2.entity;


public class User {
    private String id;
    private String name;
    private String password;

    public User() {
        super();
    }

    User(String id, String name, String password) {
        this.id = id;
        this.name = name;
        this.password = password;
    }


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


}
