package com.zhongruan.springboot2.service.Userservice.Impl;

import com.zhongruan.springboot2.dao.IUserDao;
import com.zhongruan.springboot2.entity.User;
import com.zhongruan.springboot2.service.Userservice.IUserService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class UserServiceImpl implements IUserService {
    @Autowired
    private IUserDao userDao;

    @Override
    public User getUserByid(User user) {
        return (User) userDao.FindUserByid(Integer.parseInt(user.getId()));
    }

    @Override
    public List<User> getAllUsers() {
        return userDao.getAllUsers();
    }
}
