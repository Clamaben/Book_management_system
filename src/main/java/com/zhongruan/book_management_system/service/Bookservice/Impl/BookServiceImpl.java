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
    public Book FindBookByid(int id) {
        return bookDao.findBookByid(id);
    }

    @Override
    public List<Book> FindBooksByname(String name) {
        return bookDao.findBookByname(name);
    }

    @Override
    public boolean BorrowingBookByid(int id) {
        return bookDao.BorrowingBookByid(id);
    }

    @Override
    public boolean ReturningBookByid(int id) {
        return bookDao.ReturningBookByid(id);
    }

    @Override
    public boolean AddBook(Book book) {
        return bookDao.AddBook(book);
    }

    @Override
    public boolean DeleteBookByid(int id) {
        return bookDao.DeleteBookByid(id);
    }

    @Override
    public boolean UpdataBook(Book book) {
        return UpdataBook(book);
    }

}
