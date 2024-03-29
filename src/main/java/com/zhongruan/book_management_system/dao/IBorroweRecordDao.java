package com.zhongruan.book_management_system.dao;

import com.zhongruan.book_management_system.entity.BorrowRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IBorroweRecordDao {
    //通过id寻找一条记录
    BorrowRecord FindBorrowRecordByid(int id);
    //通过借阅者id寻找记录
    List<BorrowRecord> FindBorrowRecordByBorrowerid(int id);
    //通过书籍id寻找记录
    List<BorrowRecord> FindBorrowRecordByBookid(int id);
    //通过书籍id和借阅者id寻找记录
    List<BorrowRecord> FindBorrowRecordByBookidAndBorrowerid(@Param(value = "bookid")int bookid,@Param(value = "borrowerid")int borrowerid);
    //添加一条记录
    boolean AddBorrowRecord(BorrowRecord borrowRecord);
    //修改一条记录的状态为归还
    boolean UpdateBorrowRecordStatus(BorrowRecord borrowRecord);
    //通过借阅者id寻找未归还记录
    List<BorrowRecord> FindBorrowRecordByBorroweridStatusis1(int id);
}
