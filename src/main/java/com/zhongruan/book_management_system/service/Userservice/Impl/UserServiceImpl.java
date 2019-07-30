package com.zhongruan.book_management_system.service.Userservice.Impl;

import com.zhongruan.book_management_system.dao.IUserDao;
import com.zhongruan.book_management_system.entity.User;
import com.zhongruan.book_management_system.service.Userservice.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements IUserService {
    @Autowired
    private IUserDao userDao;

    @Override
    public User getUserByid(User user) {
        return (User) userDao.findUserByid(Integer.parseInt(user.getId()));
    }

    @Override
    public List<User> getAllUsers() {
        return userDao.getAllUsers();
    }
}
