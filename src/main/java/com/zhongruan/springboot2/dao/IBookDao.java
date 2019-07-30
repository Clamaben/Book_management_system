package com.zhongruan.springboot2.dao;

import com.zhongruan.springboot2.entity.Book;

import java.util.List;

public interface IBookDao {
    Book FindBookByid(int id);
    List<Book> getAllBooks();
}
