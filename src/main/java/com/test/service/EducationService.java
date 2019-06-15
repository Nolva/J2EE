package com.test.service;

import com.test.dao.EducationDao;
import com.test.entity.Education;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EducationService {
    EducationDao EducationDAO;

    @Autowired
    public void setCusDAO(EducationDao EducationDAO) {
        this.EducationDAO = EducationDAO;
    }

    //查询所有学历信息
    public List<Education> ListEducation(){
        return EducationDAO.ListEducation();
    }
}
