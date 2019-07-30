package com.zhongruan.springboot2.controller;

import com.zhongruan.springboot2.dao.IBookDao;
import com.zhongruan.springboot2.entity.Book;
import com.zhongruan.springboot2.service.Bookservice.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BookController {
    @Autowired
    IBookService bookService;

    //返回所有books
    @RequestMapping("getAllBooks")
    public Map getAllBooks () {
        Map map = new HashMap<>();
        List<Book> books = bookService.getAllBooks();
        if (books!=null){
            map.put("Books", books);
            map.put("code", 1);
            return map;
        }
        map.put("code", 0);
        return map;
    }

}
