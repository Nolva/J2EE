package com.test.service;

import com.test.dao.ProductDao;
import com.test.entity.Product;
import com.test.dao.PageDao;
import com.test.dao.PageDaoImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {

    private ProductDao productDao;
    private PageDao pageDao;
    private static int PAGE_SIZE = 5;

    @Autowired
    public void setPage(ProductDao productDao){ this.productDao = productDao; }
    @Autowired
    public void setPageDao(PageDao pageDao) { this.pageDao = pageDao; }

    //添加产品
    //1表示productId已存在，2表示添加成功，-1表示添加失败
    public int addProduct(Product product){
        if (productDao.searchProductName(product.getProductName())>0){
            if (productDao.searchProductModel(product.getProductModel(), product.getProductId())>0)
                return 1;
        }
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
        if (productDao.searchProductName(product.getProductName())>0){
            if (productDao.searchProductModel(product.getProductModel(), product.getProductId())>0)
                return false;
        }
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
    public List<Product> ListProductByPage(int pageNum){
        return productDao.ListProductByPage(pageNum*PAGE_SIZE, PAGE_SIZE);
    }


    //返回产品总数量
    public int getProductNum(){
        return productDao.ProductSpecies();
    }

    //返回总页数
    public int getTotalPage(){
        int total = productDao.ProductSpecies();
        return pageDao.getTotalPage(total, PAGE_SIZE);
    }

}
