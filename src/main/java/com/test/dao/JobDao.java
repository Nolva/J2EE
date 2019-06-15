package com.test.dao;

import com.test.entity.Employee;
import com.test.entity.Job;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class JobDao {
    private JdbcTemplate jdbcTemplate;

    private final static String JOB = "SELECT * FROM job where departmentName=?";

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }


    //查询所有职位
    public List<Job> ListJob(String departmentName){
        return jdbcTemplate.query(JOB,new Object[]{departmentName},new BeanPropertyRowMapper<>(Job.class));
    }

}
