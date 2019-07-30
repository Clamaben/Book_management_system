package com.zhongruan.book_management_system.entity;


public class Book {
    private String id;
    private String name;
    private String ISBN;
    private String type;
    private String descp;
    private String img_url;
    private String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Book() {

    }

    public Book(String id, String name, String ISBN, String type, String descp, String img_url, String status) {
        this.id = id;
        this.name = name;
        this.ISBN = ISBN;
        this.type = type;
        this.descp = descp;
        this.img_url = img_url;
        this.status = status;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String ISBN) {
        this.ISBN = ISBN;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescp() {
        return descp;
    }

    public void setDescp(String descp) {
        this.descp = descp;
    }

    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;

    }
}
