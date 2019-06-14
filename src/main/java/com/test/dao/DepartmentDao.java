package com.test.dao;

import com.test.entity.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DepartmentDao {
    private JdbcTemplate jdbcTemplate;
    private final static String DEPARTMENT = "SELECT * FROM department";
    private final static String JOB = "SELECT * FROM job";

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    //查询所有部门
    public List<Department> ListDepartment(){
        return jdbcTemplate.query(DEPARTMENT,new BeanPropertyRowMapper<>(Department.class));
    }
}
