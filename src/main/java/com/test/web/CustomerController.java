package com.test.web;

import com.test.entity.Customer;
import com.test.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

//@RequestMapping("client")
@Controller
public class CustomerController {

    private CustomerService customerService;

    @Autowired
    public void setClientService(CustomerService customerService) {
        this.customerService = customerService;
    }

    //显示所有client信息页面
    @RequestMapping("/show")
    public String client(HttpServletRequest request) {
        for (Customer customer : customerService.ListCustomer()){
            System.out.println(customer.getClientId());
            System.out.println(customer.getCliName());
            System.out.println(customer.getCliTelephone());
            System.out.println(customer.getCliEmail());
            System.out.println(customer.getCliAddress());
        }
        request.setAttribute("customerList",customerService.ListCustomer());
        return "client";
    }



}
