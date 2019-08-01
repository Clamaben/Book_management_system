package com.zhongruan.book_management_system.controller;


import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminController {

    @RequestMapping("mainpage")
    public String mainpage() {
        return "admin";
    }
}
