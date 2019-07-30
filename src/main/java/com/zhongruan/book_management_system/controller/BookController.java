package com.zhongruan.book_management_system.controller;

import com.zhongruan.book_management_system.entity.Book;
import com.zhongruan.book_management_system.service.Bookservice.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BookController {
    @Autowired
    @Qualifier("bookService")
    IBookService bookService;

    //返回所有books
    @RequestMapping("getAllBooks")
    public Map getAllBooks() {
        Map map = new HashMap<>();
        List<Book> books = bookService.getAllBooks();
        if (books != null) {
            map.put("Books", books);
            map.put("code", 1);
            return map;
        }
        map.put("code", 0);
        return map;
    }

}
