package com.zhongruan.book_management_system.service.Bookservice;

import com.zhongruan.book_management_system.entity.Book;
import org.springframework.stereotype.Service;

import java.util.List;


public interface IBookService {
    List<Book> getAllBooks();
    Book FindBookByid(int id);
    List<Book> FindBooksByname(String name);
    boolean BorrowingBookByid(int id);
    boolean ReturningBookByid(int id);
    //添加一本书
    boolean AddBook(Book book);
    //通过id删除一本书
    boolean DeleteBookByid(int id);
    //修改一本书
    boolean UpdataBook(Book book);
}
