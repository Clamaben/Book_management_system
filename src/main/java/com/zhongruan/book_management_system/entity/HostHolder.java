package com.zhongruan.book_management_system.entity;


import org.springframework.stereotype.Component;

@Component
public class HostHolder {
    private static ThreadLocal<User> users=new ThreadLocal<>();

    public User getUser(){
        return  users.get();
    }

    public void setUser(User user) {
        users.set(user);
    }

    public void removeUser() {
        users.remove();
    }

}
