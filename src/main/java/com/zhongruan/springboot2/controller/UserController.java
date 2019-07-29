package com.zhongruan.springboot2.controller;

import com.zhongruan.springboot2.dao.IUserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
    @Autowired
    IUserDao userDao;

    @RequestMapping("toIndex")
    public String index() {
        System.out.println(userDao.getUsers());
        return "index";
    }
}
