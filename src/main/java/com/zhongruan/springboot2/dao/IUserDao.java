package com.zhongruan.springboot2.dao;

import com.zhongruan.springboot2.entity.User;

import java.util.List;

public interface IUserDao {
    List<User> getAllUsers();
    List<User> FindUserByid(int id);
}
