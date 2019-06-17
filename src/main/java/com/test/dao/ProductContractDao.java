package com.test.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProductContractDao {

    private JdbcTemplate jdbcTemplate;

    private static final String INSERT = "INSERT INTO product_contract(productId,contractId)" +
            "VALUES(?,?)";
    private static final String DELETE = "DELETE FROM product_contract WHERE contractId = ?";
    private static final String LIST_CONTRACT_ID = "SELECT contractId FROM product_contract WHERE productId = ? " +
            "ORDER BY contractId";
    private static final String LIST_PRODUCT_ID = "SELECT productId FROM product_contract WHERE contractId = ? " +
            "ORDER BY productId";

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }


    public void addById(String productId, int contractId){
        jdbcTemplate.update(INSERT, new Object[]{productId, contractId});
    }

    public void deleteById(int contractId){
        jdbcTemplate.update(DELETE, new Object[]{contractId});
    }

    public String catContract(String productId){
        List<String> s = jdbcTemplate.queryForList(LIST_CONTRACT_ID, new Object[]{productId}, String.class);
        String result = "";
        for (int i = 0; i < s.size(); i++) {
            if (i!=0)
                result = result.concat(",");
            result = result.concat(s.get(i));
        }
        return result;
    }


    //返回产品Id
    public List<String> listProductId(int contractId){
        return jdbcTemplate.queryForList(LIST_PRODUCT_ID, new Object[]{contractId}, String.class);
    }
}
