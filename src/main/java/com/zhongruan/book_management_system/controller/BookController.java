package com.zhongruan.book_management_system.controller;

import com.zhongruan.book_management_system.entity.Book;
import com.zhongruan.book_management_system.service.Bookservice.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
    @RequestMapping("getAllBooks")
    @ResponseBody
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
    @ResponseBody
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
    @ResponseBody
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
    //添加一本书,map中的code值集含义：1=添加成功；0=添加失败
    @RequestMapping("AddBook")
    @ResponseBody
    public Map AddBook (Book Addbook) {
        Map map = new HashMap<>();
            if (bookService.AddBook(Addbook)){
                map.put("code", 1);
                return map;
            }
            map.put("code", 0);
            return map;
    }
    //通过id删除一本书,map中的code值集含义：0=书籍不存在；1=删除成功；2=删除失败
    @RequestMapping("DeleteBookByid")
    @ResponseBody
    public Map DeleteBookByid (@RequestParam("id") int id) {
        Map map = new HashMap<>();
    	Book book=bookService.FindBookByid(id);
    	if (book.getName()!=null){
    	    if (bookService.DeleteBookByid(id)){
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
    @RequestMapping("UpdataBook")
    @ResponseBody
    public Map UpdataBook (Book Updatabook) {
        Map map = new HashMap<>();
        Book book = bookService.FindBookByid(Updatabook.getId());
        if (book.getName()!=null){
            if (bookService.UpdataBook(Updatabook)){
                map.put("code", 1);
                return map;
            }
            map.put("code", 2);
            return map;
        }
        map.put("code", 0);
        return map;
    }

}
