package com.zhongruan.springboot2.entity;


import java.util.Date;

public class BorrowRecord {
    private String recordId;
    private String borrowerId;
    private String bookId;
    private Date borrowTime;
    private Date dueTime;
    private String status;

    public BorrowRecord() {

    }

    public BorrowRecord(String recordId, String borrowerId, String bookId, Date borrowTime, Date dueTime, String status) {
        this.recordId = recordId;
        this.borrowerId = borrowerId;
        this.bookId = bookId;
        this.borrowTime = borrowTime;
        this.dueTime = dueTime;
        this.status=status;
    }

    public String getRecordId() {
        return recordId;
    }

    public void setRecordId(String recordId) {
        this.recordId = recordId;
    }

    public String getBorrowerId() {
        return borrowerId;
    }

    public void setBorrowerId(String corrowerId) {
        this.borrowerId = corrowerId;
    }

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    public Date getBorrowTime() {
        return borrowTime;
    }

    public void setBorrowTime(Date borrowTime) {
        this.borrowTime = borrowTime;
    }


    public Date getDueTime() {
        return dueTime;
    }

    public void setDueTime(Date dueTime) {
        this.dueTime = dueTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
