package com.test.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ManagerDao {

    private JdbcTemplate jdbcTemplate;
    private final static String Match_COUNT_SQL="SELECT COUNT(*) FROM manager WHERE managerId=? AND manPassword=?";

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public int ValidManager(String managerId,String manPassword){
        return jdbcTemplate.queryForObject(Match_COUNT_SQL,new Object[]{managerId,manPassword},Integer.class);
    }

}