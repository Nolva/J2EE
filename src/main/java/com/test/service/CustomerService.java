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


    public List<Customer> ListCustomer() {
        return customerDAO.ListCustomer();
    }
}
