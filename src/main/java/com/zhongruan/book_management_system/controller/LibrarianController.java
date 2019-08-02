package com.zhongruan.book_management_system.controller;

import com.zhongruan.book_management_system.entity.Book;
import com.zhongruan.book_management_system.service.Bookservice.IBookService;
import com.zhongruan.book_management_system.service.Bookservice.Impl.BookServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("librarian")
public class LibrarianController {
    @Autowired
    @Qualifier("bookService")
    IBookService bookService;

    @RequestMapping(value = "mainpage", method = RequestMethod.GET)
    public String mainpage() {
        return "librarian";
    }

    //添加一本书,map中的code值集含义：1=添加成功；0=添加失败
    @RequestMapping(value = "addBook", method = RequestMethod.POST)
    @ResponseBody
    public Map AddBook(Book Addbook) {
        Map map = new HashMap<>();
        if (bookService.AddBook(Addbook)) {
            map.put("code", 1);
            return map;
        }
        map.put("code", 0);
        return map;
    }

    //通过id删除一本书,map中的code值集含义：0=书籍不存在；1=删除成功；2=删除失败
    @RequestMapping(value = "deleteBookById", method = RequestMethod.POST)
    @ResponseBody
    public Map DeleteBookByid(@RequestParam("id") int id) {
        Map map = new HashMap<>();
        Book book = bookService.FindBookByid(id);
        if (book.getName() != null) {
            if (bookService.DeleteBookByid(id)) {
                map.put("code", 1);
                return map;
            }
            map.put("code", 2);
            return map;
        }
        map.put("code", 0);
        return map;
    }

    //修改一本书,map中的code值集含义：0=书籍不存在；1=修改成功；2=修改失败
    @RequestMapping(value = "updateBook", method = RequestMethod.POST)
    @ResponseBody
    public Map UpdataBook(Book book) {
        Map map = new HashMap<>();
        Book dbBook = bookService.FindBookByid(book.getId());
        if (dbBook.getName() != null) {
            if (bookService.UpdataBook(book)) {
                map.put("code", 1);
                return map;
            }
            map.put("code", 2);
            return map;
        }
        map.put("code", 0);
        return map;
    }

    @RequestMapping(value = "demo", method = RequestMethod.POST)
    @ResponseBody
    public Map demo() {
        return new HashMap();
    }

}
