package com.zhongruan.book_management_system.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("borrower")
public class BorrowerController {

    @RequestMapping("mainpage")
    public String mainpage() {
        return "borrower";
    }
}
