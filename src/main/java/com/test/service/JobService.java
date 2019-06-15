package com.test.service;

import com.test.dao.JobDao;
import com.test.entity.Employee;
import com.test.entity.Job;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class JobService {

    private JobDao jobDao;

    @Autowired
    public void setPageDao(JobDao jobDao) { this.jobDao = jobDao; }


    //查询职位信息
    public List<Job> ListJob(String departmentName) {
        return jobDao.ListJob(departmentName);
    }
}
