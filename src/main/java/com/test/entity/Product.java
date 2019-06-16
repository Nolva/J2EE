package com.test.entity;

import java.io.Serializable;

public class Product implements Serializable {
    private String productId;//产品编号
    private String productName;//产品名称
    private String productModel;//产品模型
    private Integer productNum;//产品数量
    private Double productPrice;//产品价格
    private String productCategory;
    private String productContract;

    public Product(){}
    public Product(String productId, String productName, String productModel, Integer productNum, Double productPrice) {
        this.productId = productId;
        this.productName = productName;
        this.productModel = productModel;
        this.productNum = productNum;
        this.productPrice = productPrice;
    }

    public String getProductId() {
        return productId;
    }
    public void setProductId(String productId) {
        this.productId = productId;
    }
    public String getProductName(){ return productName; }
    public void setProductName(String productName){ this.productName = productName; }
    public String getProductModel() {
        return productModel;
    }
    public void setProductModel(String productModel) {
        this.productModel = productModel;
    }
    public Integer getProductNum() {
        return productNum;
    }
    public void setProductNum(int productNum) {
        this.productNum = productNum;
    }
    public double getProductPrice() {  return productPrice; }
    public void setProductPrice(double productPrice) { this.productPrice = productPrice;}

    public String getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(String productCategory) {
        this.productCategory = productCategory;
    }

    public String getProductContract() {
        return productContract;
    }

    public void setProductContract(String productContract) {
        this.productContract = productContract;
    }

    @Override
    public String toString() {
        return "Product [productId=" + productId + ", productName=" + productName + ", productModel=" + productModel
                + ", productNum=" + productNum + ", productPrice=" + productPrice + "]";
    }
}


