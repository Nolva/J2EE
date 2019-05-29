package com.test.service;

import com.test.dao.AdministratorDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdministratorService {
    private AdministratorDao administratorDAO;

    @Autowired
    public void setUserDAO(AdministratorDao administratorDAO) {
        this.administratorDAO = administratorDAO;
    }

    public boolean hasMatch(String username,String password){
        System.out.println("service");
        int count=administratorDAO.ValidUser(username,password);
        return count>0;
    }
}