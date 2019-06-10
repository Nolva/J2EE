package com.test.web;

import com.test.entity.Contract;
import com.test.entity.Product;
import com.test.service.ContractService;
import com.test.service.PageService;
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
    private PageService pageService;
    private static int PRODUCT_PAGE_SIZE = 5;

    @Autowired
    public void setProductService(ContractService contractService, PageService pageService) {
        this.contractService = contractService;
        this.pageService = pageService;
    }

    //显示所有合同
    @RequestMapping("/contracts")
    public ModelAndView contractList(HttpServletRequest request, String page, Model model){
        List<Contract> contractList = contractService.ListContract();
        model.addAttribute("totalCount", contractList.size());
        //总页数
        model.addAttribute("totalPage", pageService.getTotalPage(contractList.size()));
        //页面初始的时候page没有值
        page = page==null?"1":page;
        //每页开始的第几条记录
        contractList = contractService.ListContractByPage(pageService.getStartRow(page),
                PRODUCT_PAGE_SIZE);
        List<String> clientIdList = contractService.ListClientId();
        List<String> sellerIdList = contractService.ListSellerId();
        //System.out.println(clientIdList.size());
        model.addAttribute("currentPage", Integer.parseInt(page));
        model.addAttribute("contractList", contractList);
        model.addAttribute("clientIdList", clientIdList);
        model.addAttribute("sellerIdList", sellerIdList);
        return new ModelAndView("contract");
    }
    //增加合同
    @RequestMapping("/addContract")
    public String Product_add(HttpServletRequest request, Contract contract){
        HttpSession session = request.getSession();
        if (session.getAttribute("manager") != null) {
            int isAdd = contractService.addContract(contract);
            if (isAdd == -1){
                request.setAttribute("contractInfo", "添加合同失败！");
            }else if (isAdd == 1){
                request.setAttribute("contractInfo", "合同ID已存在，添加失败！");
            }else{
                request.setAttribute("contractInfo", "添加合同成功！");
            }
            return "contractMessage";
        }
        return "redirect:/contract/contracts";
    }

    //删除合同
    @RequestMapping("/deleteContract")
    public String product_delete(HttpServletRequest request, Contract contract) {
        HttpSession session = request.getSession();
        if (session.getAttribute("manager") != null) {
            boolean isDelete = contractService.deleteContract(contract.getContractId());
            if (!isDelete) {
                request.setAttribute("contractInfo", "无法删除该合同！");
            } else {
                request.setAttribute("contractInfo", "删除合同成功！");
            }
            return "contractMessage";
        }
        return "redirect:/contract/contracts";
    }

    //修改合同
    @RequestMapping("/updateContract")
    public String update(HttpServletRequest request, Contract contract){
        HttpSession session = request.getSession();
        if (session.getAttribute("manager") != null) {
            //System.out.println(contract.getClientNo());
            boolean isUpdate = contractService.updateContractId(contract);
            if (!isUpdate) {
                request.setAttribute("contractInfo", "无法修改该合同！");
            } else {
                request.setAttribute("contractInfo", "修改合同成功！");
            }
            return "contractMessage";
        }
        return "redirect:/contract/contracts";
    }
}
