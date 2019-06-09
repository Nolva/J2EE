package com.test.web;

import com.test.Page.Page;
import com.test.entity.Product;
import com.test.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RequestMapping("product")
@Controller
public class ProductController {

    private ProductService productService;
    private static int PRODUCT_PAGE_SIZE = 5;
    
    @Autowired
    public void setProductService(ProductService productService) { this.productService = productService; }

    //显示所有产品
    @RequestMapping("/products")
    public ModelAndView productList(String page, Model model){
        List<Product> productList = productService.ListProduct();
        model.addAttribute("totalCount", productList.size());
        //总页数
        int totalPage;
        if(productList.size()%PRODUCT_PAGE_SIZE == 0) {
            totalPage = productList.size()/PRODUCT_PAGE_SIZE;
        }else{
            totalPage = productList.size()/PRODUCT_PAGE_SIZE + 1;
        }
        model.addAttribute("totalPage", totalPage);
        //页面初始的时候page没有值
        if (page == null)
            page = "1";
        //每页开始的第几条记录
        int startRow = (Integer.parseInt(page)-1) * PRODUCT_PAGE_SIZE;
        productList = productService.ListProductByPage(startRow, PRODUCT_PAGE_SIZE);
        System.out.print("page: "+page+" startrow:"+startRow);
        model.addAttribute("currentPage", Integer.parseInt(page));
        model.addAttribute("ProductList", productList);

        return new ModelAndView("product");
    }
    //增加产品
    @RequestMapping("/addProduct")
    public String Product_add(HttpServletRequest request, Product product){
        HttpSession session = request.getSession();
        if (session.getAttribute("product") != null) {
            int isAdd = productService.addProduct(product);
            if (isAdd == -1){
                request.setAttribute("productInfo", "添加产品失败！");
            }else if (isAdd == 1){
                request.setAttribute("productInfo", "产品ID已存在，添加失败！");
            }else{
                request.setAttribute("productInfo", "添加产品成功！");
            }
            return "productMessage";
        }
    return "redirect:/product/products";
    }

    //删除产品
    @RequestMapping("/deleteProduct")
    public String product_delete(HttpServletRequest request, Product product) {
        HttpSession session = request.getSession();
        if (session.getAttribute("product") != null) {
            boolean isDelete = productService.deleteProduct(product.getProductId());
            if (!isDelete) {
                request.setAttribute("productInfo", "无法删除该产品！");
            } else {
                request.setAttribute("productInfo", "删除产品成功！");
            }
            return "productMessage";
        }
        return "redirect:/product/products";
    }

    //修改商品
    @RequestMapping("/updateProduct")
    public String update(HttpServletRequest request, Product product){
        HttpSession session = request.getSession();
        if (session.getAttribute("product") != null) {
            boolean isUpdate = productService.updateProductId(product);
            if (!isUpdate) {
                request.setAttribute("productInfo", "无法修改该产品！");
            } else {
                request.setAttribute("productInfo", "修改产品成功！");
            }
            return "productMessage";
        }
        return "redirect:/product/products";
    }

}
