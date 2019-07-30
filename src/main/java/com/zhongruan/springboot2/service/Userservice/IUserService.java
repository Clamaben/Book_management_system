package com.zhongruan.springboot2.service.Userservice;

import com.zhongruan.springboot2.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface IUserService {
    User getUserByid(User user);
    List<User> getAllUsers();
}
