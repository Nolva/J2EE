package com.test.service;

import com.test.entity.Customer;
import com.test.dao.CustomerDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerService {
    private CustomerDao customerDAO;

    @Autowired
    public void setCusDAO(CustomerDao customerDAO) {
        this.customerDAO = customerDAO;
    }

    //查询信息
    public List<Customer> ListCustomer() {
        return customerDAO.ListCustomer();
    }

    //分页管理
    public List<Customer> ListManagerByPage(int startRow, int pageSize){
        return customerDAO.ListManagerByPage(startRow, pageSize);
    }

    //删除信息
    public boolean DeleteCustomer(String clientId){
        int count = customerDAO.DeleteCustomer(clientId);
        return count>0;
    }

    //修改信息
    public boolean ChangeCustomer(Customer customer){
        System.out.println("Service:"+customer.getClientId());
        System.out.println(customer.getCliName());
        System.out.println(customer.getCliTelephone());
        try {
            customerDAO.ChangeCustomer(customer);
        }catch (Exception e){
            System.out.println(e);
            return false;
        }
        return true;
    }

    //添加客户  1表示客户存在，2表示添加成功，-1表示添加失败
    public int AddCustomer(Customer customer){
        int isPresence = customerDAO.SearchCustomer(customer.getClientId());
        if (isPresence > 0)
            return 1;
        int count = customerDAO.AddCustomer(customer);
        if (count>0)
            return 2;
        return -1;
    }
}
