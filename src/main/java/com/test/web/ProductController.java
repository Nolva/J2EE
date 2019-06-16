package com.test.web;

import com.test.entity.Product;
import com.test.service.CategoryService;
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
    private CategoryService categoryService;
    
    @Autowired
    public void setProductService(ProductService productService) { this.productService = productService; }
    @Autowired
    public void setCategoryService(CategoryService categoryService){
        this.categoryService = categoryService;
    }

    //显示所有产品
    @RequestMapping("/products")
    public String productList(HttpServletRequest request){
        String page = request.getParameter("page") == null?"1":request.getParameter("page");//获取页码，默认1

        request.setAttribute("totalCount", productService.getProductNum());
        request.setAttribute("totalPage", productService.getTotalPage());
        request.setAttribute("currentPage", Integer.parseInt(page));
        request.setAttribute("productList", productService.ListProductByPage(Integer.parseInt(page)-1));
        request.setAttribute("categoryList", categoryService.ListCategory());
        return "product";
    }
    //增加产品
    @RequestMapping("/addProduct")
    public String Product_add(HttpServletRequest request, Product product){
        HttpSession session = request.getSession();
        if (session.getAttribute("manager") != null) {
            int isAdd = productService.addProduct(product);
            if (isAdd == -1){
                request.setAttribute("productInfo", "添加产品失败！");
            }else if (isAdd == 1){
                request.setAttribute("productInfo", "产品已存在，添加失败！");
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
        if (session.getAttribute("manager") != null) {
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
        if (session.getAttribute("manager") != null) {
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
