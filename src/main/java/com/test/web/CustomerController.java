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
    private static int CUSTOMER_PAGE_SIZE = 10;

    @Autowired
    public void setClientService(CustomerService customerService) {
        this.customerService = customerService;
    }

    //显示所有client信息页面
    @RequestMapping("/show")
    public ModelAndView show(String page, Model model){
//        for (Customer customer : customerService.ListCustomer()){
//            System.out.println(customer.getClientId());
//            System.out.println(customer.getCliName());
//        }
        List<Customer> customerList = customerService.ListCustomer();
        model.addAttribute("totalCount", customerList.size());
        //总页数
        int totalPage;
        if(customerList.size()%CUSTOMER_PAGE_SIZE == 0) {
            totalPage = customerList.size()/CUSTOMER_PAGE_SIZE;
        }else{
            totalPage = customerList.size()/CUSTOMER_PAGE_SIZE + 1;
        }
        model.addAttribute("totalPage", totalPage);
        //页面初始的时候page没有值
        if (page == null)
            page = "1";
        //每页开始的第几条记录
        int startRow = (Integer.parseInt(page)-1) * CUSTOMER_PAGE_SIZE;
        customerList = customerService.ListManagerByPage(startRow, CUSTOMER_PAGE_SIZE);
        System.out.print("page: "+page+" startrow:"+startRow);
        model.addAttribute("currentPage", Integer.parseInt(page));
        model.addAttribute("customerList", customerList);

        return new ModelAndView("client");
//        request.setAttribute("customerList",customerService.ListCustomer());
//        return "client";
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
