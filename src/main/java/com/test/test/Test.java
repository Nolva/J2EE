package com.test.test;

import com.test.dao.ManagerDao;
import com.test.dao.ProductDao;
import com.test.entity.Manager;
import com.test.entity.Product;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test {
    private ProductDao productDao;
    private ManagerDao managerDao;

    public ManagerDao getManagerDao() {
        return managerDao;
    }

    public void setManagerDao(ManagerDao managerDao) {
        this.managerDao = managerDao;
    }

    public ProductDao getProductDao() {
        return productDao;
    }

    public void setProductDao(ProductDao productDao) {
        this.productDao = productDao;
    }

    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        Product product = new Product();
        Manager manager = new Manager();

        product.setProductId("nolva235");
        product.setProductName("N01va");

        manager.setManagerId("nolva235");
        manager.setManPassword("53235");
        manager.setManName("N01va");
        manager.setManPer(2);

        ProductDao dao1 = (ProductDao) context.getBean("productDao");
        dao1.addProduct(product);
        ManagerDao dao2 = (ManagerDao) context.getBean("managerDao");
        //dao2.AddManager(manager);
    }

}
