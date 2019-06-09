package com.test.dao;

import com.test.Page.Page;
import com.test.Page.PageDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PageDaoImp implements PageDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    //获得总记录数
    public int getTotalRecord(String sql, Object... arrayParameters) {
        int totalRecord = jdbcTemplate.queryForObject(sql, arrayParameters,Integer.class);
        return totalRecord;
    }

    //获取当前页数据
    public Page getPage(int pageNum, Class clazz, String sql, int totalRecord, Object... parameters) {
        Page page = new Page(pageNum, totalRecord);
        sql = sql+" limit "+page.getStartIndex()+","+page.getPageSize();
        List list=jdbcTemplate.query(sql, parameters, BeanPropertyRowMapper.newInstance(clazz));
        page.setList(list);
        return page;
    }
}
