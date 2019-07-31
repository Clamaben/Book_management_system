package com.zhongruan.book_management_system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

    //跳转登录界面
    @RequestMapping("toLogin")
    public String toLogin() {
        return "login";
    }

    @RequestMapping("toSetting")
    public String toSetting() {
        return "admin-setting";
    }


}
