package com.test.service;

import com.test.dao.DepartmentDao;
import com.test.entity.Department;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentService {
    private DepartmentDao DepartmentDAO;

    @Autowired
    public void setCusDAO(DepartmentDao DepartmentDAO) {
        this.DepartmentDAO = DepartmentDAO;
    }

    //查询信息
    public List<Department> ListDepartment() {
        return DepartmentDAO.ListDepartment();
    }
}
