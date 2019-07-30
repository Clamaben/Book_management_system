package com.zhongruan.book_management_system.controller;

import com.zhongruan.book_management_system.entity.User;
import com.zhongruan.book_management_system.service.Userservice.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class UserController {
    @Autowired
    @Qualifier("userService")
    IUserService userService;

    @RequestMapping("toIndex")
    public String index() {
        System.out.println(userService.getAllUsers());
        return "index";
    }

    //跳转登录界面
    @RequestMapping("toLogin")
    public String toLogin() {
        return "Login";
    }

    //登录是否成功
    @RequestMapping("Login")
    public Map Login(User user, Model model, HttpServletRequest request) {
        User db_user = userService.getUserByid(user);
        Map map = new HashMap<>();
        if (db_user.getName() != null) {
            if (db_user.getPassword().equals(user.getPassword())) {
                HttpSession session = request.getSession();
                session.setAttribute("user", db_user);
                map.put("logincode", 1);
                return map;
            }
        }
        map.put("msg", "账号或者密码错误！");
        map.put("user", user);
        map.put("logincode", 0);
        return map;
    }
    //


}
