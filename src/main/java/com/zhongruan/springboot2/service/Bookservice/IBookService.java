package com.zhongruan.springboot2.service.Bookservice;

import com.zhongruan.springboot2.entity.Book;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface IBookService {
    List<Book> getAllBooks();
    Book FindBookByid(Book book);
}
