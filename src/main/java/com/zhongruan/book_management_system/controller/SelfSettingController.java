package com.zhongruan.book_management_system.controller;

import com.zhongruan.book_management_system.entity.User;
import com.zhongruan.book_management_system.service.Userservice.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;
@Controller
@RequestMapping("self")
public class SelfSettingController {
    @Autowired
    @Qualifier("userService")
    IUserService userService;
    @RequestMapping(value="updateByName",method = RequestMethod.POST)
    @ResponseBody
    public Map updateByName(User user)
    {
        System.out.println(user);
        int flag=userService.updateById(user);
        Map<String,Object> map=new HashMap<>();
        if(flag==1)
        {
            map.put("msg","更新成功");
            map.put("code",0);
            return map;
        }else
        {
            map.put("msg","更新失败");
            map.put("code",1);
            return map;
        }
    }
}
