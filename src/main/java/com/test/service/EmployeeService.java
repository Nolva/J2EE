package com.test.service;

import com.test.dao.EmployeeDao;
import com.test.dao.PageDao;
import com.test.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {
    private EmployeeDao employeeDAO;
    private static int PAGE_SIZE = 5;
    private PageDao pageDao;

    @Autowired
    public void setEmpDAO(EmployeeDao employeeDAO) {
        this.employeeDAO = employeeDAO;
    }
    @Autowired
    public void setPageDao(PageDao pageDao) { this.pageDao = pageDao; }

    //查询信息
    public List<Employee> ListEmployee() {
        return employeeDAO.ListEmployee();
    }

    //分页管理
    public List<Employee> ListManagerByPage(int startRow){
        return employeeDAO.ListEmployeeByPage(startRow*PAGE_SIZE, PAGE_SIZE);
    }

    //修改信息
    public boolean ChangeEmployee(Employee employee){
        try {
            employeeDAO.ChangeEmployee(employee);
        }catch (Exception e){
            System.out.println(e);
            return false;
        }
        return true;
    }

    //删除信息
    public boolean DeleteEmployee(String employeeId){
        int count = employeeDAO.DeleteEmployee(employeeId);
        return count>0;
    }

    //添加信息
     public int AddEmployee(Employee employee){
         int isPresence = employeeDAO.SearchCustomer(employee.getEmployeeId());
         if (isPresence > 0)
             return 1;
         int count = employeeDAO.AddEmployee(employee);
         if (count>0)
             return 2;
         return -1;
     }

    public int getEmployeeNum(){
        return  employeeDAO.getEmployeeNum();
    }

    public int getTotalPage(){
        int total = employeeDAO.getEmployeeNum();
        return pageDao.getTotalPage(total, PAGE_SIZE);
    }

    //查询部门信息
    public List<Employee> ListDepartment() {
        return employeeDAO.ListDepartment();
    }

}
