package com.test.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ProductContractDao {

    private JdbcTemplate jdbcTemplate;

    private static String PRODUCT_ID = "SELECT productId FROM product WHERE productName=? " +
            "AND productModel=?";

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public void addByName(String productName, int contractId){
        int count = jdbcTemplate.queryForObject(PRODUCT_ID, Integer.class);
    }
}
