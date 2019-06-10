package com.test.web;

import com.test.entity.Contract;
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

    @Autowired
    public void setProductService(ContractService contractService) {
        this.contractService = contractService;
    }

    //显示所有合同
    @RequestMapping("/contracts")
    public String contractList(HttpServletRequest request){
        String page = request.getParameter("page") == null?"1":request.getParameter("page");//获取页码，默认1

        request.setAttribute("totalCount", contractService.getContractNum());
        request.setAttribute("totalPage", contractService.getTotalPage());
        request.setAttribute("currentPage", Integer.parseInt(page));
        request.setAttribute("contractList", contractService.ListContractByPage(Integer.parseInt(page)-1));
        request.setAttribute("clientIdList", contractService.ListClientId());
        request.setAttribute("sellerIdList", contractService.ListSellerId());

        return "contract";
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
