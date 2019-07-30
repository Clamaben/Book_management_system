package com.zhongruan.springboot2.service.Bookservice.Impl;

import com.zhongruan.springboot2.dao.IBookDao;
import com.zhongruan.springboot2.entity.Book;
import com.zhongruan.springboot2.service.Bookservice.IBookService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class BookServiceImpl implements IBookService {
    @Autowired
    IBookDao bookDao;
    @Override
    public List<Book> getAllBooks() {
        return bookDao.getAllBooks();
    }

    @Override
    public Book FindBookByid(Book book) {
        return bookDao.FindBookByid(Integer.parseInt(book.getId()));
    }
}
