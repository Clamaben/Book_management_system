package com.zhongruan.book_management_system.controller;


import com.zhongruan.book_management_system.entity.Book;
import com.zhongruan.book_management_system.entity.BorrowRecord;
import com.zhongruan.book_management_system.service.Bookservice.IBookService;
import com.zhongruan.book_management_system.service.BorrowRecordService.IBorrowRecordService;
import com.zhongruan.book_management_system.service.BorrowRecordService.Impl.BorrowRecordServiceImpl;
import com.zhongruan.book_management_system.service.Userservice.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
    @Autowired
    @Qualifier("borrowRecordService")
    IBorrowRecordService borrowRecordService;

    @RequestMapping("mainpage")
    public String mainpage() {
        return "borrower";
    }
    //通过id借书,map中的code值集含义：0=书籍不存在；1=借阅成功；2=借阅失败，库存为0
    @RequestMapping("BorroweingBookByid")
    @ResponseBody
    public Map BorroweingBookByid (@RequestParam("borrowerid") int borrowerid,@RequestParam("bookid") int bookid) {
        Map map = new HashMap<>();
        Book book = bookService.FindBookByid(bookid);
        if (book != null) {
            if (book.getStock()!=0){
                BorrowRecord borrowRecord = new BorrowRecord();
                borrowRecord.setBookId(bookid);
                borrowRecord.setBorrowerId(borrowerid);
                borrowRecord.setStatus(1);
                borrowRecord.setBorrowTime(new Date());
                if(bookService.BorrowingBookByid(bookid)&&borrowRecordService.AddBorrowRecord(borrowRecord)){
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
    public Map ReturningBookByid (@RequestParam("borrowerid") int borrowerid,@RequestParam("bookid") int bookid) {
        Map map = new HashMap<>();
        Book book = bookService.FindBookByid(bookid);
        if (book != null) {
            BorrowRecord borrowRecord = borrowRecordService.FindBorrowRecordByBookidAndBorrowerid(bookid, borrowerid);
            if (borrowRecordService.UpdateBorrowRecordStatus(borrowRecord)&&bookService.ReturningBookByid(bookid)) {
                map.put("code", 1);
                return map;
            }
        }
        map.put("code", 0);
        return map;
    }
    //返回当前用户的所有借阅书籍
    @RequestMapping("getBorrowRecord")
    @ResponseBody
    public Map getBorrowRecord (@RequestParam("borrowerid") int borrowerid) {
        Map map = new HashMap<>();
        List<BorrowRecord> borrowRecordList = borrowRecordService.FindBorrowRecordByBorrowerid(borrowerid);
        if (borrowRecordList.size() > 0) {
            List<Book> bookList = null;
            for (BorrowRecord br:borrowRecordList) {
                bookList.add(bookService.FindBookByid(br.getBookId()));
            }
            map.put("booklist", bookList);
            map.put("borrowrecordlist", borrowRecordList);
            map.put("code", 1);
            return map;
        }
        map.put("code", 0);
        return map;
    }
}
