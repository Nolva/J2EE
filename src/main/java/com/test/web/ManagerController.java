package com.test.web;

import com.test.entity.Manager;
import com.test.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@RequestMapping("administrator")
@Controller
public class ManagerController {
    private ManagerService managerService;

    @Autowired
    public void setUserService(ManagerService managerService) {
        this.managerService = managerService;
    }

    //查看所有管理员
    @RequestMapping("/show")
    public String show(HttpServletRequest request){
//        for(Manager manager : managerService.ListManager()) {
//            System.out.println(manager.getManagerId());
//            System.out.println(manager.getManPassword());
//        }
        // 数据量大，不应该使用Session存储
//        request.getSession().setAttribute("managerList", managerService.ListManager());
        request.setAttribute("managerList", managerService.ListManager());
        return "index";
    }

    //修改管理员信息
    @RequestMapping("/change")
    public String change(HttpServletRequest request, Manager manager){

        System.out.println(manager.getManagerId());
        System.out.println(manager.getManName());
        System.out.println(manager.getManEmail());
        System.out.println(manager.getManTelephone());

        return "redirect:/administrator/show";
    }
}
