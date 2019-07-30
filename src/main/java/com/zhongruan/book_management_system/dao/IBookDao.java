package com.zhongruan.book_management_system.dao;

import com.zhongruan.book_management_system.entity.Book;

import java.util.List;


public interface IBookDao {
    Book findBookByid(int id);
    List<Book> getAllBooks();
}
