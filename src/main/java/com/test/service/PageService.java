package com.test.service;

import com.test.dao.ContractDao;
import com.test.entity.Contract;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PageService {

    //分页条数
    private static int PRODUCT_PAGE_SIZE = 5;

    //获取总页数
    public int getTotalPage(int size){
        if(size % PRODUCT_PAGE_SIZE == 0) {
            return  size/PRODUCT_PAGE_SIZE;
        }else{
            return  size/PRODUCT_PAGE_SIZE + 1;
        }
    }

    //获取开始行
    public int getStartRow(String page){
        return (Integer.parseInt(page)-1) * PRODUCT_PAGE_SIZE;
    }
}
