package com.test.dao;

import com.test.entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CustomerDao {
    private JdbcTemplate jdbcTemplate;
    private final static String CLIENT_RESULT_SQL = "SELECT * FROM client";

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }


    //查询数据库所有客户信息集合
    public List<Customer> ListCustomer() {
        return jdbcTemplate.query(CLIENT_RESULT_SQL,new BeanPropertyRowMapper<>(Customer.class));
    }

}
