package com.zhongruan.book_management_system.controller;

import com.zhongruan.book_management_system.entity.User;
import com.zhongruan.book_management_system.service.Userservice.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

@Controller
public class IndexController {
    @Autowired
    @Qualifier("userService")
    IUserService userService;

    //跳转登录界面
    @RequestMapping("toLogin")
    public String toLogin(@RequestParam(value = "error", defaultValue = "false") String error,
                          Model model) {
        if (error.equals("true")) {
            model.addAttribute("msg", "用户名或密码错误");
        }
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

    @RequestMapping("toRegister")
    public String toRegister() {
        return "register";
    }

    //注册接口，code 0失败，1成功，2用户名重复，只有借阅者可以注册，管理员需要后台添加
    @RequestMapping(value = "register",method = RequestMethod.POST)
    @ResponseBody
    public Map register(User user) {
        Map<String, Object> map = new HashMap<>();
        if(userService.getUserByname(user.getUsername())!=null){
            map.put("code",2);
            return map;
        }
        user.setRole("BORROWER");
        int flag = userService.add(user);
        map.put("code", flag);
        return map;
    }
}
