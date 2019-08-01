package com.zhongruan.book_management_system.controller;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import java.util.Set;

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

    @RequestMapping("toIndex")
    public String toIndex() {
        return "index";
    }
}
