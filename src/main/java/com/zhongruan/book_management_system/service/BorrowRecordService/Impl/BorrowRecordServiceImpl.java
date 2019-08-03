package com.zhongruan.book_management_system.service.BorrowRecordService.Impl;

import com.github.pagehelper.PageHelper;
import com.zhongruan.book_management_system.dao.IBorroweRecordDao;
import com.zhongruan.book_management_system.entity.BorrowRecord;
import com.zhongruan.book_management_system.service.BorrowRecordService.IBorrowRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("borrowRecordService")
public class
BorrowRecordServiceImpl implements IBorrowRecordService {
    @Autowired
    IBorroweRecordDao borroweRecordDao;
    @Override
    public BorrowRecord FindBorrowRecordByid(int id) {
        return borroweRecordDao.FindBorrowRecordByid(id);
    }

    @Override
    public List<BorrowRecord> FindBorrowRecordByBorrowerid(int id) {
        return borroweRecordDao.FindBorrowRecordByBorrowerid(id);
    }

    @Override
    public List<BorrowRecord> FindBorrowRecordByBookid(int id) {
        return borroweRecordDao.FindBorrowRecordByBookid(id);
    }

    @Override
    public boolean AddBorrowRecord(BorrowRecord borrowRecord) {
        return borroweRecordDao.AddBorrowRecord(borrowRecord);
    }

    @Override
    public boolean UpdateBorrowRecordStatus(BorrowRecord borrowRecord) {
        return borroweRecordDao.UpdateBorrowRecordStatus(borrowRecord);
    }

    @Override
    public BorrowRecord FindBorrowRecordByBookidAndBorrowerid(int bookid, int borrowerid) {
        List<BorrowRecord> borrowRecords = borroweRecordDao.FindBorrowRecordByBookidAndBorrowerid(bookid,borrowerid);
        BorrowRecord borrowRecord = borrowRecords.get(0);
        for (BorrowRecord borrowRecord1:borrowRecords) {
            if (borrowRecord1.getStatus() == 1 && borrowRecord1.getBorrowTime().compareTo(borrowRecord.getBorrowTime()) >= 0) {
                borrowRecord = borrowRecord1;
            }
        }
        return borrowRecord;
    }

    @Override
    public List<BorrowRecord> getSomeBorrowRecord(int pageNum, int pageSize, int id) {
        PageHelper.startPage(pageNum,pageSize);
        return borroweRecordDao.FindBorrowRecordByBorrowerid(id);
    }
}
