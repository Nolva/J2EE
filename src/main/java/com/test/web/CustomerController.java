package com.test.web;

import com.test.entity.Customer;
import com.test.entity.Manager;
import com.test.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RequestMapping("client")
@Controller
public class CustomerController {

    private CustomerService customerService;

    @Autowired
    public void setClientService(CustomerService customerService) {
        this.customerService = customerService;
    }

    //显示所有client信息页面
    @RequestMapping("/show")
    public String show(HttpServletRequest request){
        String page = request.getParameter("page") == null?"1":request.getParameter("page");//获取页码，默认1

        request.setAttribute("totalCount", customerService.getCustomerNum());
        request.setAttribute("totalPage", customerService.getTotalPage());
        request.setAttribute("currentPage", Integer.parseInt(page));
        request.setAttribute("customerList", customerService.ListManagerByPage(Integer.parseInt(page)-1));

        return "client";
    }

    //删除信息
    @RequestMapping("/delete")
    public String delete(HttpServletRequest request, Customer customer) {

        System.out.println(customer.getClientId());
            boolean isDelete = customerService.DeleteCustomer(customer.getClientId());//id是null的
            System.out.println(customer.getClientId());
            if (!isDelete){
                request.setAttribute("message", "无法删除客户！");
            }else {
                request.setAttribute("message", "删除客户成功！");
            }

        return "customerMessage";
    }

    //修改信息
    @RequestMapping("/change")
    public String change(HttpServletRequest request, Customer customer){
        boolean isChange = customerService.ChangeCustomer(customer);
        if (!isChange){
            request.setAttribute("message","无法修改客户信息！");
        }else{
            request.setAttribute("message","修改客户信息成功！");
        }
        return "customerMessage";
    }

    //添加客户
    @RequestMapping("/add")
    public String add(HttpServletRequest request,Customer customer){
        System.out.println(customer.getClientId());
        int isAdd = customerService.AddCustomer(customer);
        if (isAdd == -1){
            request.setAttribute("message", "添加客户失败！");
        }else if (isAdd == 1){
            request.setAttribute("message", "客户ID已存在，添加失败！");
        }else{
            request.setAttribute("message", "添加客户成功！");
        }
        return "customerMessage";
    }
}
