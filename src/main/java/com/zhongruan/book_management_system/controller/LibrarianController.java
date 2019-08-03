package com.zhongruan.book_management_system.controller;

import com.zhongruan.book_management_system.entity.Book;
import com.zhongruan.book_management_system.service.Bookservice.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("librarian")
public class LibrarianController {
    @Autowired
    @Qualifier("bookService")
    IBookService bookService;

    @RequestMapping(value = "mainpage", method = RequestMethod.GET)
    public String mainpage() {
        return "librarian";
    }

    //添加一本书,map中的code值集含义：1=添加成功；0=添加失败
    @RequestMapping(value = "addBook", method = RequestMethod.POST)
    @ResponseBody
    public Map AddBook(Book Addbook) {
        Map<String, Object> map = new HashMap<>();
        if (bookService.AddBook(Addbook)) {
            map.put("code", 1);
            return map;
        }
        map.put("code", 0);
        return map;
    }

    //通过id删除一本书,map中的code值集含义：0=删除成功；1=书籍不存在；2=删除失败
    @RequestMapping(value = "deleteBookById", method = RequestMethod.POST)
    @ResponseBody
    public Map DeleteBookByid(@RequestParam("id") int id) {
        Map<String, Object> map = new HashMap<>();
        Book book = bookService.FindBookByid(id);
        if (book.getName() != null) {
            if (bookService.DeleteBookByid(id)) {
                map.put("code", 0);
                return map;
            }
            map.put("code", 2);
            return map;
        }
        map.put("code", 1);
        return map;
    }

    //修改一本书,map中的code值集含义：0=修改成功；1=书籍不存在；2=修改失败
    @RequestMapping(value = "updateBook", method = RequestMethod.POST)
    @ResponseBody
    public Map UpdataBook(Book book) {
        Map<String, Object> map = new HashMap<>();
        Book dbBook = bookService.FindBookByid(book.getId());
        if (dbBook.getName() != null) {
            if (bookService.UpdataBook(book)) {
                map.put("code", 0);
                return map;
            }
            map.put("code", 2);
            return map;
        }
        map.put("code", 1);
        return map;
    }

    @RequestMapping(value = "demo", method = RequestMethod.POST)
    @ResponseBody
    public Map demo() {
        return new HashMap();
    }

    @RequestMapping("toUpload")
    public String toUpload() {
        return "fileUpload";
    }

    //返回值中的img_url带上了图片的地址，加上${root}/static访问到图片
    //新增图书时，将img_url提交，保存到数据库中
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    @ResponseBody
    public Map uplaod(HttpServletRequest req, @RequestParam("file") MultipartFile file) {
        Map<String, Object> map = new HashMap<>();
        String fileName = System.currentTimeMillis() + file.getOriginalFilename();
        try {
            //根据时间戳创建新的文件名，这样即便是第二次上传相同名称的文件，也不会把第一次的文件覆盖了
            //通过req.getServletContext().getRealPath("") 获取当前项目的真实路径，然后拼接前面的文件名
            String destFileName = req.getServletContext().getRealPath("") + "static/images" + File.separator + fileName;
            File destFile = new File(destFileName);
            //把浏览器上传的文件复制到希望的位置
            file.transferTo(destFile);
        } catch (IOException e) {
            map.put("msg", "上传失败");
            map.put("code", 1);
            return map;
        }
        map.put("code", 0);
        map.put("msg", "上传成功");
        String img_url = "images/" + fileName;
        map.put("img_url", img_url);
        return map;
    }

}
