package com.zhongruan.book_management_system.dao;

import com.zhongruan.book_management_system.entity.User;

import java.util.List;

public interface IUserDao {
    List<User> getAllUsers();
    List<User> findUserByid(int id);
}
