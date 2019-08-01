
package com.zhongruan.book_management_system.entity;


public class User {
    private int id;
    private String username;
    private String password;
    //角色分为 LIBRARIAN（图书管理员）,BORROWER（借阅者）,ADMIN（管理员），角色之间的权限互不相关
    //每个用户只能拥有一个角色
    private String role;
    private String degree;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) { this.password = password; }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }
}
