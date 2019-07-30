package com.zhongruan.book_management_system.entity;

import java.util.Date;

public class LoginTicket {

    String ticket;
    String userId;
    String role;
    Date expired;
    int status;//0代表登陆 1代表注销

    public LoginTicket() {
    }

    public LoginTicket(String ticket, String userId, String role, Date expired, int status) {
        this.ticket = ticket;
        this.userId = userId;
        this.role = role;
        this.expired = expired;
        this.status = status;
    }


    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getTicket() {
        return ticket;
    }

    public void setTicket(String ticket) {
        this.ticket = ticket;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Date getExpired() {
        return expired;
    }

    public void setExpired(Date expired) {
        this.expired = expired;
    }
}
