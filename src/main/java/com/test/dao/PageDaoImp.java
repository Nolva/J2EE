package com.test.dao;

import org.springframework.stereotype.Repository;


@Repository
public class PageDaoImp implements PageDao {

    //获得总记录数
    public int getTotalPage(int total, int pageSize) {
        int totalPage;
        if(total % pageSize == 0) {
            totalPage = total/pageSize;
        }else{
            totalPage = total/pageSize + 1;
        }
        return totalPage;
    }

}