package com.zhongruan.book_management_system.service.Bookservice;

import com.zhongruan.book_management_system.entity.Book;
import org.springframework.stereotype.Service;

import java.util.List;


public interface IBookService {
    List<Book> getAllBooks();
    Book FindBookByid(Book book);
}