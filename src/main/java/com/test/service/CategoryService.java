package com.test.service;

import com.test.dao.CategoryDao;
import com.test.entity.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService {
    private CategoryDao categoryDao;

    @Autowired
    public void setCategoryDao(CategoryDao categoryDao){
        this.categoryDao = categoryDao;
    }

    //查询职位信息
    public List<Category> ListCategory() {
        return categoryDao.ListCategory();
    }
}
