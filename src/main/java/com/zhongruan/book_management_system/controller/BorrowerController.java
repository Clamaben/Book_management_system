package com.zhongruan.book_management_system.controller;


import com.zhongruan.book_management_system.entity.Book;
import com.zhongruan.book_management_system.service.Bookservice.IBookService;
import com.zhongruan.book_management_system.service.Userservice.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("borrower")
public class BorrowerController {
    @Autowired
    @Qualifier("bookService")
    IBookService bookService;
    @Autowired
    @Qualifier("userService")
    IUserService userService;

    @RequestMapping("mainpage")
    public String mainpage() {
        return "borrower";
    }
    //通过id借书,map中的code值集含义：0=书籍不存在；1=借阅成功；2=借阅失败，库存为0
    @RequestMapping("BorroweingBookByid")
    @ResponseBody
    public Map BorroweingBookByid (@RequestParam("id") int id) {
        Map map = new HashMap<>();
        Book book = bookService.FindBookByid(id);
        if (book != null) {
            if (book.getStock()!=0){
                if(bookService.BorrowingBookByid(id)){
                    map.put("code", 1);
                    return map;
                }
            }
            map.put("code", 2);
            return map;
        }
        map.put("code", 0);
        return map;
    }
    //通过id归还一本书，map中的code值集含义：0=书籍不存在；1=归还成功；
    @RequestMapping("ReturningBookByid")
    @ResponseBody
    public Map ReturningBookByid (@RequestParam("id") int id) {
        Map map = new HashMap<>();
        Book book = bookService.FindBookByid(id);
        if (book != null) {
            if (bookService.ReturningBookByid(id)) {
                map.put("code", 1);
                return map;
            }
        }
        map.put("code", 0);
        return map;
    }
}
