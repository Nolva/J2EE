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

    //查询管理员
    public List<Manager> ListManager(){
        return managerDAO.ListManager();
    }

    //分页查询管理员
    public List<Manager> ListManagerByPage(int startRow, int pageSize){
        return managerDAO.ListManagerByPage(startRow, pageSize);
    }

    //判断是否为超级管理员
    public boolean isSuperManager(String managerId){
        int count = managerDAO.ValidManagerPer(managerId);
        return count>0;
    }

    //更新管理员信息
    public boolean UpdateManagerInfo(Manager manager){
        try {
            managerDAO.UpdateManagerInfo(manager);
        }catch (Exception e){
            System.out.println(e);
            return false;
        }
        return true;
    }

    //删除管理员
    public boolean DeleteManager(String managerId){
        if(isSuperManager(managerId))
            return false;
        int count = managerDAO.DeleteManager(managerId);
        return count>0;
    }

    //添加管理员
    //1表示管理员存在，2表示添加成功，-1表示添加失败
    public int AddManager(Manager manager){
        int isPresence = managerDAO.SearchManager(manager.getManagerId());
        if (isPresence > 0)
            return 1;
        int count = managerDAO.AddManager(manager);
        if (count>0)
            return 2;
        return -1;
    }
}