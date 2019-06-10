package com.test.dao;

import com.test.entity.Contract;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class ContractDao {
    private JdbcTemplate jdbcTemplate;

    private static final String INSERT = "INSERT INTO Contract (contractId,clientNo,employeeId,contractName," +
            "contractContent,contractStartTime,contractValidity) VALUES (?,?,?,?,?,?,?)";
    private static final String DELETE = "DELETE FROM Contract WHERE contractId = ?";
    private static final String UPDATE = "UPDATE Contract SET clientNo=?,employeeId=?,contractName=?,contractContent=?," +
            "contractStartTime=?,contractValidity=? WHERE contractId=?";
    private static final String GET = "SELECT * FROM Contract WHERE clientNo = ?";
    private static final String SELECT ="SELECT * FROM Contract ORDER BY clientNo";
    private static final String SELECT_BY_PAGE ="SELECT * FROM Contract ORDER BY clientNo LIMIT ?,?";
    private static final String EXIST_Contract = "SELECT COUNT(*) FROM Contract WHERE clientNo=?";
    private static final String Contract_SPECIES = "SELECT COUNT(*) FROM Contract";
    private static final String CLIENT_ID_LIST = "SELECT clientId FROM client";
    private static final String SELLER_ID_LIST = "SELECT employeeId FROM employee WHERE empTitle='销售员'";

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    //增加合同
    public int addContract(Contract contract){ return jdbcTemplate.update(INSERT, new Object[]{contract.getContractId(),
            contract.getClientNo(),contract.getEmployeeId(),contract.getContractName(),contract.getContractContent(),
            contract.getContractStartTime(),contract.getContractValidity()}); }

    //删除合同
    public int deleteContract(Integer contractId){ return jdbcTemplate.update(DELETE, new Object[]{contractId});}

    //修改产品
    public void updateContract(Contract contract){
        int count = jdbcTemplate.update(UPDATE, new Object[]{contract.getClientNo(),contract.getEmployeeId(),
                contract.getContractName(),contract.getContractContent(),contract.getContractStartTime(),
                contract.getContractValidity(),contract.getContractId()});
//        if(count > 0){
//            System.out.println("更新成功!");
//        }
    }

    //查询单个产品的信息
    public List<Contract> getContractById(Integer contractId){
        return jdbcTemplate.query(GET, new Object[]{contractId}, new RowMapper<Contract>() {
            @Override
            public Contract mapRow(ResultSet rs, int rowNum) throws SQLException {
                Contract contract = new Contract();
                contract.setContractId(rs.getInt("ContractId"));
                contract.setClientNo(rs.getString("ClientNo"));
                contract.setEmployeeId(rs.getString("EmployeeId"));
                contract.setContractName(rs.getString("ContractName"));
                contract.setContractContent(rs.getString("ContractContent"));
                contract.setContractStartTime(rs.getString("ContractStartTime"));
                contract.setContractValidity(rs.getString("ContractValidity"));
                return contract;
            }
        });
    }

    //查询所有产品的集合--确定页数
    public List<Contract> ListContract(){
        RowMapper<Contract> rowMapper = new BeanPropertyRowMapper<>(Contract.class);
        List<Contract> contracts = jdbcTemplate.query(SELECT, rowMapper);
        return contracts;
    }

    //当前页的集合
    public List<Contract> ListContractByPage(int startIndex, int pageSize){
        return jdbcTemplate.query(SELECT_BY_PAGE,new Object[]{startIndex,pageSize},new BeanPropertyRowMapper<>(Contract.class));
    }

    //是否已存在ContractId
    public int ExistContractId(Integer contractId){
        return jdbcTemplate.queryForObject(EXIST_Contract,new Object[] {contractId},Integer.class);
    }

    //查询全部客户Id
    public List<String> ListClientId(){
        return jdbcTemplate.queryForList(CLIENT_ID_LIST, String.class);
    }

    //查询全部销售员Id
    public  List<String> ListSellerId(){
        return jdbcTemplate.queryForList(SELLER_ID_LIST, String.class);
    }

}
