package com.test.web;

import com.test.entity.Department;
import com.test.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

//@RequestMapping("employee")
@Controller
public class DepartmentController {

    private DepartmentService departmentService;

    @Autowired
    public void setClientService(DepartmentService departmentService) {
        this.departmentService = departmentService;
    }

    //显示所有department信息页面
   // @RequestMapping("/show")
    public void show(HttpServletRequest request) {

        request.setAttribute("departmentList1", departmentService.ListDepartment());
        for (Department department : departmentService.ListDepartment()){
            System.out.println("controller:"+department.getDepartmentName());
        }
       // return "employee";
    }
}
