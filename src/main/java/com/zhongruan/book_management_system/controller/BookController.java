package com.zhongruan.book_management_system.controller;

import com.zhongruan.book_management_system.entity.Book;
import com.zhongruan.book_management_system.service.Bookservice.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BookController {
    @Autowired
    @Qualifier("bookService")
    IBookService bookService;

    //返回所有books
    @ResponseBody
    @RequestMapping(value = "getAllBooks", method = RequestMethod.POST)
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
    //通过id查询一本书
    @RequestMapping("getBookByid")
    public Map getBookByid (@RequestParam("id") int id) {
        Map map = new HashMap<>();
        Book book = bookService.FindBookByid(id);
        if (book != null) {
            map.put("Book", book);
            map.put("code", 1);
            return map;
        }
        map.put("code", 0);
        return map;
    }
    //通过书名模糊查询返回书籍列表
    @RequestMapping("getBooksByname")
    public Map getBooksByname (@RequestParam("name") String name) {
        Map map = new HashMap<>();
        List<Book> books = bookService.FindBooksByname(name);
        if (books != null) {
            map.put("Books", books);
            map.put("code", 1);
            return map;
        }
        map.put("code", 0);
        return map;
    }

    @RequestMapping("toBookManage")
    public String toBookManage (Model model) {

        List<Book> bookList =bookService.getAllBooks();
        model.addAttribute("bookList",bookList);

        return "book_manage";
    }

}
