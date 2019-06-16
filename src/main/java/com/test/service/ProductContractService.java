package com.test.service;

import com.test.dao.ProductContractDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductContractService {
    ProductContractDao productContractDao;

    @Autowired
    public void setProductContractDao(ProductContractDao productContractDao){
        this.productContractDao = productContractDao;
    }

    public void addByName(String productName, int contractId){
        productContractDao.addByName(productName, contractId);
    }
}
