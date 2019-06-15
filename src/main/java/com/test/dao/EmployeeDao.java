package com.test.dao;

import com.test.entity.Department;
import com.test.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class EmployeeDao {
    private JdbcTemplate jdbcTemplate;
    private final static String EMPLOYEE_RESULT_SQL = "SELECT employeeId,empName,empSex, empBirthday,empDepartment,empTitle,empHireDate,empSalary,empTelephone,empEmail,empAddress,empEducation FROM employee";
    private final static String EMPLOYEE_RESULT_BY_PAGE_SQL = "SELECT * FROM employee LIMIT ?,?";
    private final static String EMPLOYEE_DEL_SQL = "DELETE FROM employee where employeeId = ?";
    private final static String EMPLOYEE_UPDATE_SQL = "UPDATE employee SET employeeId = ?,empName = ?," +
            "empSex = ?,empBirthday=?,empDepartment=?,empTitle=?,empHireDate=?,empSalary=?," +
            "empTelephone = ?,empEmail = ?,empAddress = ? ,empEducation= ? where employeeId = ? " ;
    private final static String EMPLOYEE_Search_SQL = "SELECT COUNT(*) FROM employee where employeeId = ?";
    private final static String EMPLOYEE_Add_SQL = "INSERT INTO employee values(?,?,?,?,?,?,?,?,?,?,?,?)";
    private final static String EMPLOYEE_NUM = "SELECT COUNT(*) FROM employee";

    private final static String DEPARTMENT = "SELECT * FROM department";

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    //查询所有部门
    public List<Employee> ListDepartment(){
        return jdbcTemplate.query(DEPARTMENT,new BeanPropertyRowMapper<>(Employee.class));
    }

    //查询数据库所有员工信息集合
    public List<Employee> ListEmployee() {
        return jdbcTemplate.query(EMPLOYEE_RESULT_SQL,new BeanPropertyRowMapper<>(Employee.class));
    }

    //分页管理，从第一条开始取，取n条记录，（0，n）
    public List<Employee> ListEmployeeByPage(int startRow, int pageSize){
        return jdbcTemplate.query(EMPLOYEE_RESULT_BY_PAGE_SQL,new Object[]{startRow,pageSize}
                ,new BeanPropertyRowMapper<>(Employee.class));
    }

    //删除信息
    public int DeleteEmployee(String employeeId){
        return jdbcTemplate.update(EMPLOYEE_DEL_SQL, employeeId);
    }

    //修改信息
    public int ChangeEmployee(Employee employee){
        return jdbcTemplate.update(EMPLOYEE_UPDATE_SQL, new Object[] {employee.getEmployeeId(),
                employee.getEmpName(),
                employee.getEmpSex(), employee.getEmpBirthday(),
                employee.getEmpDepartment(),employee.getEmpTitle(),
                employee.getEmpHireDate(),employee.getEmpSalary(),
                employee.getEmpTelephone(),employee.getEmpEmail(),
                employee.getEmpAddress(),employee.getEmpEducation(),
                employee.getEmployeeId()});
    }

    //查询客户是否存在
    public int SearchCustomer(String clientId){
        return jdbcTemplate.queryForObject(EMPLOYEE_Search_SQL,new Object[] {clientId},Integer.class);
    }

    //添加客户
    public int AddEmployee(Employee employee){
        return  jdbcTemplate.update(EMPLOYEE_Add_SQL, new Object[] {employee.getEmployeeId(),
                employee.getEmpName(), employee.getEmpSex(), employee.getEmpBirthday(),
                employee.getEmpDepartment(),employee.getEmpTitle(),employee.getEmpHireDate(),employee.getEmpSalary(),
                employee.getEmpTelephone(),employee.getEmpEmail(),employee.getEmpAddress(),employee.getEmpEducation()});
    }

    public int getEmployeeNum(){
        return jdbcTemplate.queryForObject(EMPLOYEE_NUM, Integer.class);
    }


}
