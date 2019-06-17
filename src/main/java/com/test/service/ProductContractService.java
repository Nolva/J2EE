package com.test.service;

import com.test.dao.ProductContractDao;
import com.test.dao.ProductDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductContractService {
    ProductContractDao productContractDao;
    ProductDao productDao;

    @Autowired
    public void setProductContractDao(ProductContractDao productContractDao){
        this.productContractDao = productContractDao;
    }
    @Autowired
    public void setProductDao(ProductDao productDao){
        this.productDao = productDao;
    }

    public void addById(List<String> productId, int contractId){
        for (int i = 0; i < productId.size(); i++) {
            productContractDao.addById(productId.get(i), contractId);
            productDao.updateContract(productContractDao.catContract(productId.get(i)),productId.get(i));
        }
    }

    public void deleteById(int contractId){
        List<String> s = productContractDao.listProductId(contractId);
        productContractDao.deleteById(contractId);
        for (int i = 0; i < s.size(); i++) {
            productDao.updateContract(productContractDao.catContract(s.get(i)), s.get(i));
        }
        //productDao.updateContract(productContractDao.catContract(contractId));
    }
}
