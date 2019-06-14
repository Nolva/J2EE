package com.test.service;

import com.test.dao.ContractDao;
import com.test.dao.PageDao;
import com.test.entity.Contract;
import com.test.entity.Customer;
import com.test.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContractService {
    private ContractDao ContractDao;
    private static int PAGE_SIZE = 5;
    private PageDao pageDao;

    @Autowired
    public void setContractDao(ContractDao ContractDao){ this.ContractDao = ContractDao; }
    @Autowired
    public void setPageDao(PageDao pageDao) { this.pageDao = pageDao; }


    //添加产品
    //1表示ContractId已存在，2表示添加成功，-1表示添加失败
    public int addContract(Contract contract){
        int existId = ContractDao.ExistContractId(contract.getContractId());
        if (existId > 0)
            return 1;
        int count = ContractDao.addContract(contract);
        if (count>0)
            return 2;
        return -1;
    }

    //修改
    public boolean updateContractId(Contract contract){
        try{
            ContractDao.updateContract(contract);
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    //查询单个的信息
    public List<Contract> getContractById(Integer ContractId){ return ContractDao.getContractById(ContractId); }

    //删除
    public boolean deleteContract(Integer ContractId){
        int count = ContractDao.deleteContract(ContractId);
        return count > 0;
    }

    //查询全部x
    public List<Contract> ListContract(){
        return ContractDao.ListContract();
    }

    //分页查询
    public List<Contract> ListContractByPage(int startIndex){
        return ContractDao.ListContractByPage(startIndex*PAGE_SIZE, PAGE_SIZE);
    }

    //查询全部客户Id
    public List<Customer> ListClient(){
        return ContractDao.ListClient();
    }

    //查询全部销售员Id
    public List<Employee> ListSeller(){
        return ContractDao.ListSeller();
    }

    public int getContractNum(){
        return  ContractDao.getContractNum();
    }

    public int getTotalPage(){
        int total = ContractDao.getContractNum();
        return pageDao.getTotalPage(total, PAGE_SIZE);
    }

}
