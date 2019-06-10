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
    private final static String CLIENT_RESULT_BY_PAGE_SQL = "SELECT * FROM client LIMIT ?,?";
    private final static String CLIENT_DEL_SQL = "DELETE FROM client where clientId = ?";
    private final static String CLIENT_UPDATE_SQL = "UPDATE client SET clientId = ?,cliName = ?," +
           "cliTelephone = ?,cliEmail = ?,cliAddress = ? where clientId = ?" ;
    private final static String CLIENT_Search_SQL = "SELECT COUNT(*) FROM client where clientId = ?";
    private final static String CLIENT_Add_SQL = "INSERT INTO client values(?,?,?,?,?)";
    private final static String CUSTOMER_NUM = "SELECT COUNT(*) FROM client";

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }


    //查询数据库所有客户信息集合
    public List<Customer> ListCustomer() {
        return jdbcTemplate.query(CLIENT_RESULT_SQL,new BeanPropertyRowMapper<>(Customer.class));
    }

    //分页管理，从第一条开始取，取n条记录，（0，n）
    public List<Customer> ListManagerByPage(int startRow, int pageSize){
        return jdbcTemplate.query(CLIENT_RESULT_BY_PAGE_SQL,new Object[]{startRow,pageSize}
                ,new BeanPropertyRowMapper<>(Customer.class));
    }

    //删除信息
    public int DeleteCustomer(String clientId){
        return jdbcTemplate.update(CLIENT_DEL_SQL, clientId);
    }

    //修改信息
    public int ChangeCustomer(Customer customer){
        return jdbcTemplate.update(CLIENT_UPDATE_SQL, new Object[] {customer.getClientId(),
                customer.getCliName(), customer.getCliTelephone(),
                customer.getCliEmail(), customer.getCliAddress(),customer.getClientId()});
    }

    //查询客户是否存在
    public int SearchCustomer(String clientId){
        return jdbcTemplate.queryForObject(CLIENT_Search_SQL,new Object[] {clientId},Integer.class);
    }

    //添加客户
    public int AddCustomer(Customer customer){
        return  jdbcTemplate.update(CLIENT_Add_SQL, new Object[] {customer.getClientId(),
                customer.getCliName(),
                customer.getCliTelephone(), customer.getCliEmail(),
                customer.getCliAddress()});
    }

    public int getCustomerNum(){
        return jdbcTemplate.queryForObject(CUSTOMER_NUM, Integer.class);

    }
}
