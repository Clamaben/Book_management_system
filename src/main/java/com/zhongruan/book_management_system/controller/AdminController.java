package com.zhongruan.book_management_system.controller;


import com.github.pagehelper.PageInfo;
import com.zhongruan.book_management_system.entity.User;
import com.zhongruan.book_management_system.service.Userservice.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("admin")
public class AdminController {
    @Autowired
    @Qualifier("userService")
    IUserService userService;
    @RequestMapping("mainpage")
    public String mainpage() {
        return "admin";
    }

    @RequestMapping("delUserById")
    @ResponseBody
    public Map delUserById(@RequestParam("id")Integer id)
    {  //这里获得的id是从删除那里来的
        int flag = userService.deleteById(id);
        Map<String,Object> map=new HashMap<>();
        if (flag==0)
        {

            map.put("msg","删除失败");
            map.put("code",1);
            return map;
        }
        map.put("msg","删除成功");
        map.put("code",0);
        return map;
    }
    @RequestMapping("getAllUser")
    @ResponseBody
    public Map getAllUser (@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                           @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        List<User> users = userService.getAllUsers(pageNum, pageSize);
        Map<String,Object> map=new HashMap<>();
        PageInfo<User> pageInfo = new PageInfo<>(users);
        map.put("pageInfo", pageInfo);
        return map;
        /**
         *         Map<String, Object> map = new HashMap<>();
         *         List<Book> books = bookService.getSomeBooks(pageNum, pageSize);
         *         PageInfo<Book> pageInfo = new PageInfo<>(books);
         *         map.put("pageInfo", pageInfo);
         *         return map;
         */
    }

    @RequestMapping("add")
    @ResponseBody
    public Map add(User user)
    {
        Map<String,Object> map=new HashMap<>();
        if(userService.getUserByname(user.getUsername())!=null){
            map.put("code",2);
            map.put("msg","用户名重复");
            return map;
        }
        int flag=userService.add(user);
        if(flag==1)
        {
            map.put("msg","添加成功");
            map.put("code",0);
            return map;
        }else
        {
            map.put("msg","添加失败");
            map.put("code",1);
            return map;
        }
    }

    @RequestMapping("updateById")
    @ResponseBody
    public Map updateById(User user)
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

    @RequestMapping("queryById")
    @ResponseBody
    public Map queryById(User user)
    {
        System.out.println(user);
        User db_user=userService.queryById(user);
        Map<String,Object> map=new HashMap<>();
        if(db_user==null)
        {
            map.put("code",1);
            map.put("msg","不存在该用户");
            return map;
        }else
        {
            map.put("code",0);
            map.put("msg","查询成功");
            map.put("id",db_user.getId());
            map.put("username",db_user.getUsername());
            map.put("password",db_user.getPassword());
            map.put("role",db_user.getRole());
            return map;
        }
    }
}
