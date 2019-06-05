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
    private final static String MANAGER_RESULT_BY_PAGE_SQL = "SELECT * FROM manager LIMIT ?,?";
    private final static String SUPER_MANAGER_COUNT_SQL = "SELECT COUNT(*) FROM manager WHERE managerId=? AND manPer=2";
    private final static String UPDATE_MANAGER_INFO_SQL = "UPDATE manager SET manPassword=?, manName=?, " +
            "manTelephone=?, manEmail=? WHERE managerId =?";
    private final static String DELETE_MANAGER_SQL = "DELETE FROM manager WHERE managerId=?";
    private final static String SEARCH_MANAGER_SQL = "SELECT COUNT(*) FROM manager WHERE managerId=?";
    private final static String INSERT_MANAGER_SQL = "INSERT INTO manager VALUES(?,?,?,?,?,?)";

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

    public List<Manager> ListManagerByPage(int startRow, int pageSize){
        return jdbcTemplate.query(MANAGER_RESULT_BY_PAGE_SQL,new Object[]{startRow,pageSize}
        ,new BeanPropertyRowMapper<>(Manager.class));
    }

    //判断是否为超级管理员
    public int ValidManagerPer(String managerId){
        return jdbcTemplate.queryForObject(SUPER_MANAGER_COUNT_SQL,new Object[]{managerId},Integer.class);
    }

    //更新管理员信息
    public void UpdateManagerInfo(Manager manager){

        jdbcTemplate.update(UPDATE_MANAGER_INFO_SQL, new Object[] {manager.getManPassword(),
                manager.getManName(), manager.getManTelephone(),
                manager.getManEmail(), manager.getManagerId()});
    }

    //删除管理员
    public int DeleteManager(String managerId){
        return jdbcTemplate.update(DELETE_MANAGER_SQL, managerId);
    }

    //查询管理员是否存在
    public int SearchManager(String managerId){
        return jdbcTemplate.queryForObject(SEARCH_MANAGER_SQL, new Object[] {managerId},Integer.class);
    }

    //添加管理员
    public int AddManager(Manager manager){
        return  jdbcTemplate.update(INSERT_MANAGER_SQL, new Object[] {manager.getManagerId(),
                manager.getManPassword(),
                manager.getManName(), manager.getManTelephone(),
                manager.getManEmail(), 1});
    }

}