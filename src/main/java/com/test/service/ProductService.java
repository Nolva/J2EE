package com.test.service;

import com.test.dao.ProductDao;
import com.test.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {
    private ProductDao productDao;

    @Autowired
    public void setProductDao(ProductDao productDao){ this.productDao = productDao; }

    //添加产品
    //1表示productId已存在，2表示添加成功，-1表示添加失败
    public int addProduct(Product product){
        int existId = productDao.ExistProductId(product.getProductId());
        if (existId > 0)
            return 1;
        int count = productDao.addProduct(product);
        if (count>0)
            return 2;
        return -1;
    }

    //修改
    public boolean updateProductId(Product product){
        try{
            productDao.updateProduct(product);
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }
    //查询单个的信息
    public List<Product> getProductById(Integer productId){ return productDao.getProductById(productId); }
    //删除
    public boolean deleteProduct(String productId){
        int count = productDao.deleteProduct(productId);
        return count > 0;
    }
    //查询全部
    public List<Product> ListProduct(){
        return productDao.ListProduct();
    }
    //分页查询
    public List<Product> ListProductByPage(int startIndex, int pageSize){
        return productDao.ListProductByPage(startIndex, pageSize);
    }
}
