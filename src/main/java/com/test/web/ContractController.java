package com.test.web;

import com.test.entity.Contract;
import com.test.entity.Product;
import com.test.service.ContractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RequestMapping("contract")
@Controller
public class ContractController {

    private ContractService contractService;
    private static int PRODUCT_PAGE_SIZE = 5;

    @Autowired
    public void setProductService(ContractService contractService) { this.contractService = contractService; }

    //显示所有合同
    @RequestMapping("/contracts")
    public ModelAndView contractList(String page, Model model){
        List<Contract> contractList = contractService.ListContract();
        model.addAttribute("totalCount", contractList.size());
        //总页数
        int totalPage;
        if(contractList.size()%PRODUCT_PAGE_SIZE == 0) {
            totalPage = contractList.size()/PRODUCT_PAGE_SIZE;
        }else{
            totalPage = contractList.size()/PRODUCT_PAGE_SIZE + 1;
        }
        model.addAttribute("totalPage", totalPage);
        //页面初始的时候page没有值
        if (page == null)
            page = "1";
        //每页开始的第几条记录
        int startRow = (Integer.parseInt(page)-1) * PRODUCT_PAGE_SIZE;
        contractList = contractService.ListContractByPage(startRow, PRODUCT_PAGE_SIZE);
        System.out.print("page: "+page+" startrow:"+startRow);
        model.addAttribute("currentPage", Integer.parseInt(page));
        model.addAttribute("ContractList", contractList);

        return new ModelAndView("contract");
    }
    //增加产品
    @RequestMapping("/addContract")
    public String Product_add(HttpServletRequest request, Contract contract){
        HttpSession session = request.getSession();
        if (session.getAttribute("contract") != null) {
            int isAdd = contractService.addContract(contract);
            if (isAdd == -1){
                request.setAttribute("contractInfo", "添加产品失败！");
            }else if (isAdd == 1){
                request.setAttribute("contractInfo", "产品ID已存在，添加失败！");
            }else{
                request.setAttribute("contractInfo", "添加产品成功！");
            }
            return "contractMessage";
        }
        return "redirect:/contract/contracts";
    }

    //删除产品
    @RequestMapping("/deleteContract")
    public String product_delete(HttpServletRequest request, Contract contract) {
        HttpSession session = request.getSession();
        if (session.getAttribute("product") != null) {
            boolean isDelete = contractService.deleteContract(contract.getContractId());
            if (!isDelete) {
                request.setAttribute("contractInfo", "无法删除该产品！");
            } else {
                request.setAttribute("contractInfo", "删除产品成功！");
            }
            return "contractMessage";
        }
        return "redirect:/contract/contracts";
    }

    //修改商品
    @RequestMapping("/updateContract")
    public String update(HttpServletRequest request, Contract contract){
        HttpSession session = request.getSession();
        if (session.getAttribute("product") != null) {
            boolean isUpdate = contractService.updateContractId(contract);
            if (!isUpdate) {
                request.setAttribute("contractInfo", "无法修改该产品！");
            } else {
                request.setAttribute("contractInfo", "修改产品成功！");
            }
            return "contractMessage";
        }
        return "redirect:/contract/contracts";
    }
}
