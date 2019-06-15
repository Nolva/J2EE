package com.test.dao;

import com.test.entity.Education;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class EducationDao {
    private JdbcTemplate jdbcTemplate;
    private final static String EDUCATION = "SELECT * FROM education";

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Education> ListEducation(){
        return jdbcTemplate.query(EDUCATION,new BeanPropertyRowMapper<>(Education.class));
    }
}
