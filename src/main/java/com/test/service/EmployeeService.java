package com.test.service;

import com.test.dao.EmployeeDao;
import com.test.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeService {
    private EmployeeDao employeeDAO;

    @Autowired
    public void setEmpDAO(EmployeeDao employeeDAO) {
        this.employeeDAO = employeeDAO;
    }

    //查询信息
    public List<Employee> ListEmployee() {
        return employeeDAO.ListEmployee();
    }

    //分页管理
    public List<Employee> ListManagerByPage(int startRow, int pageSize){
        return employeeDAO.ListEmployeeByPage(startRow, pageSize);
    }

    //修改信息
    public boolean ChangeEmployee(Employee employee){
        System.out.println("Service:"+employee.getEmployeeId());
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

}
