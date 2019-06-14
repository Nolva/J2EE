package com.test.web;

import com.mysql.cj.xdevapi.JsonArray;
import com.test.entity.Customer;
import com.test.entity.Employee;
import com.test.service.EmployeeService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@RequestMapping("employee")
@Controller
public class EmployeeController {

    private EmployeeService employeeService;

    @Autowired
    public void setEmployeeService(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    //显示所有client信息页面
    @RequestMapping("/show")
    public String show(HttpServletRequest request){
        String page = request.getParameter("page") == null?"1":request.getParameter("page");//获取页码，默认1

        request.setAttribute("totalCount", employeeService.getEmployeeNum());
        request.setAttribute("totalPage", employeeService.getTotalPage());
        request.setAttribute("currentPage", Integer.parseInt(page));
        request.setAttribute("employeeList", employeeService.ListManagerByPage(Integer.parseInt(page)-1));
        request.setAttribute("departmentList", employeeService.ListDepartment());
        //request.setAttribute("jobList", employeeService.ListJob());
        return "employee";
    }

    //查询职业jobList
    @RequestMapping("/queryJob.shtml")
    @ResponseBody
    public void ListJob(Integer jodId, HttpServletResponse response,Model model){
        try{
            List<Employee> job = employeeService.ListJob(jodId);
            JSONArray json = JSONArray.fromObject(job);
            System.out.println("员工职位");
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;character=utf-8");
            response.getWriter().println(json);
        }catch(IOException e){
            e.printStackTrace();
        }
    }

    //删除信息
    @RequestMapping("/delete")
    public String delete(HttpServletRequest request,Employee employee) {

        System.out.println(employee.getEmployeeId());
        boolean isDelete = employeeService.DeleteEmployee(employee.getEmployeeId());//id是null的
        System.out.println(employee.getEmployeeId());
        if (!isDelete){
            request.setAttribute("message", "无法删除客户！");
        }else {
            request.setAttribute("message", "删除客户成功！");
        }

        return "employeeMessage";
    }

    //修改信息
    @RequestMapping("/change")
    public String change(HttpServletRequest request, Employee employee){
//        System.out.println("employeecontroller："+employee.getEmployeeId());
//        System.out.println("employeecontroller："+employee.getEmpEducation());
        boolean isChange = employeeService.ChangeEmployee(employee);
        if (!isChange) {
            request.setAttribute("message", "无法修改员工信息！");
        } else {
            request.setAttribute("message", "修改员工信息成功！");
        }

        return "employeeMessage";
    }

    //添加员工
    @RequestMapping("/add")
    public String add(HttpServletRequest request,Employee employee){
//        System.out.println(employee.getEmpSex());
        int isAdd = employeeService.AddEmployee(employee);
        if (isAdd == -1){
            request.setAttribute("message", "添加员工失败！");
        }else if (isAdd == 1){
            request.setAttribute("message", "员工ID已存在，添加失败！");
        }else{
            request.setAttribute("message", "添加员工成功！");
        }
        return "employeeMessage";
    }
}
