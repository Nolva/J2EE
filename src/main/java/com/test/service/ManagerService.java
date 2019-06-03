package com.test.service;

import com.test.dao.ManagerDao;
import com.test.entity.Manager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ManagerService {
    private ManagerDao managerDAO;

    @Autowired
    public void setUserDAO(ManagerDao managerDAO) {
        this.managerDAO = managerDAO;
    }

    public boolean hasMatch(String managerId,String manPassword){
        int count= managerDAO.ValidManager(managerId,manPassword);
        return count>0;
    }

    public List<Manager> ListManager(){
        return managerDAO.ListManager();
    }
}