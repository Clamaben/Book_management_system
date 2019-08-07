package com.zhongruan.book_management_system.dao;

import com.zhongruan.book_management_system.entity.User;

import java.util.List;

public interface IUserDao {
    List<User> getAllUsers();

    User getUserById(int id);
    User getByUsername(String username);
    int add(User user);

    int deleteById(Integer id);

    int updateById(User user);
    int updateByName(User user);

    User queryById(User user);
}
