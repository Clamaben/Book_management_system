package com.zhongruan.book_management_system.service.Bookservice.Impl;

import com.zhongruan.book_management_system.dao.IBookDao;
import com.zhongruan.book_management_system.entity.Book;
import com.zhongruan.book_management_system.service.Bookservice.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("bookService")
public class BookServiceImpl implements IBookService {
    @Autowired
    IBookDao bookDao;
    @Override
    public List<Book> getAllBooks() {
        return bookDao.getAllBooks();
    }

    @Override
    public Book FindBookByid(Book book) {
        return bookDao.findBookByid(Integer.parseInt(book.getId()));
    }
}
