package com.test.web;

import com.test.entity.Job;
import com.test.entity.Product;
import com.test.service.CategoryService;
import com.test.service.ProductService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
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
        //System.out.println(request.getParameter("category"));
        String page = request.getParameter("page") == null?"1":request.getParameter("page");//获取页码，默认1
        String category = request.getParameter("category") == null?"全部":request.getParameter("category");

        if (category.equals("全部")){
            request.setAttribute("totalCount", productService.getProductNum());
            request.setAttribute("totalPage", productService.getTotalPage());
            request.setAttribute("productList", productService.ListProductByPage(Integer.parseInt(page) - 1));
        }else {
            request.setAttribute("totalCount", productService.getProductNumByName(category));
            request.setAttribute("totalPage", productService.getTotalPageByName(category));
            request.setAttribute("productList", productService.ListProductByPageAndName(category, Integer.parseInt(page) - 1));
        }
        request.setAttribute("currentPage", Integer.parseInt(page));
        request.setAttribute("categoryList", categoryService.ListCategory());
        request.setAttribute("category", category);
        return "product";
    }
    //增加产品
    @RequestMapping("/addProduct")
    public String Product_add(HttpServletRequest request, Product product){
        HttpSession session = request.getSession();
        if (session.getAttribute("manager") != null) {
            int isAdd = productService.addProduct(product);
            request.setAttribute("category",product.getProductCategory());
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
            request.setAttribute("category",product.getProductCategory());
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
            request.setAttribute("category",product.getProductCategory());
            if (!isUpdate) {
                request.setAttribute("productInfo", "无法修改该产品！");
            } else {
                request.setAttribute("productInfo", "修改产品成功！");
            }
            return "productMessage";
        }
        return "redirect:/product/products";
    }

    //查询分类
    @RequestMapping("/queryCategory.shtml")
    @ResponseBody
    public void queryJob(String category, HttpServletResponse response, Model model){
        //System.out.println(category);
        List<Product> products;
        if (category.equals("全部"))
            products = productService.ListProduct();
        else
            products = productService.ListProductByName(category);
        JSONArray json = JSONArray.fromObject(products);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;character=utf-8");
        try {
            response.getWriter().println(json);
        }catch (IOException e){
            System.out.println("fail to ajax");
        }
    }

}
