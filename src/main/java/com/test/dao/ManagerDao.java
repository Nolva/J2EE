package com.test.dao;

import com.test.entity.Manager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


import java.util.List;

@Repository
public class ManagerDao {

    private JdbcTemplate jdbcTemplate;
    private final static String Match_COUNT_SQL="SELECT COUNT(*) FROM manager WHERE managerId=? AND manPassword=?";
    private final static String MANAGER_RESULT_SQL = "SELECT * FROM manager";

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    //判断管理员是否存在于数据库
    public int ValidManager(String managerId,String manPassword){
        return jdbcTemplate.queryForObject(Match_COUNT_SQL,new Object[]{managerId,manPassword},Integer.class);
    }

    //查询数据库所有管理员集合
    public List<Manager> ListManager(){
        return jdbcTemplate.query(MANAGER_RESULT_SQL,new BeanPropertyRowMapper<>(Manager.class));
    }

}