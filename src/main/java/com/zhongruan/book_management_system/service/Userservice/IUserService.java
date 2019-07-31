package com.zhongruan.book_management_system.service.Userservice;

import com.zhongruan.book_management_system.entity.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import java.util.List;


public interface IUserService extends UserDetailsService {
    User getUserByid(User user);

    List<User> getAllUsers();
}
