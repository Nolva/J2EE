package com.test.dao;

import com.test.entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CategoryDao {

    private JdbcTemplate jdbcTemplate;

    private static String LIST_ALL_CATEGORY = "SELECT * FROM category";

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Category> ListCategory(){
        RowMapper<Category> rowMapper = new BeanPropertyRowMapper<>(Category.class);
        List<Category> categories = jdbcTemplate.query(LIST_ALL_CATEGORY, rowMapper);
        return categories;
    }
}
