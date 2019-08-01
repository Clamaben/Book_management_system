package com.zhongruan.book_management_system.dao;

import com.zhongruan.book_management_system.entity.Book;

import java.util.List;


public interface IBookDao {
    //通过id寻找一本书
    Book findBookByid(int id);
    //返回所有书籍的列表
    List<Book> getAllBooks();
    //通过一个书名模糊查询
    List<Book> findBookByname(String name);
    //通过id借一本书
    boolean BorrowingBookByid(int id);
    //通过id归还一本书
    boolean ReturningBookByid(int id);
    //添加一本书
    boolean AddBook(Book book);
    //通过id删除一本书
    boolean DeleteBookByid(int id);
    //修改一本书
    boolean UpdataBook(Book book);
}
