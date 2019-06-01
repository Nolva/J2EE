package com.test.web;

import com.test.entity.Manager;
import com.test.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;
import javax.servlet.http.HttpSession;

import javax.servlet.http.HttpServletRequest;


@Controller
public class LoginController {
    private ManagerService managerService;

    @Autowired
    public void setUserService(ManagerService managerService) {
        this.managerService = managerService;
    }

    //登录后的首页
    @RequestMapping("/index")
    public String index(Model model,HttpServletRequest request){
        HttpSession session = request.getSession();
        model.addAttribute("manager",session.getAttribute("manager"));
//        System.out.println(session.getAttribute("manager"));
        return "index";
    }

    //登录页面
    @RequestMapping("/tologin")
    public String tologin(){
        return "login";
    }

    //判断登录
    @RequestMapping("/login")
    public String  login(HttpServletRequest request, Manager manager){
        boolean isValidUser= managerService.hasMatch(manager.getManagerId(),
                manager.getManPassword());
        if (isValidUser){
            request.getSession().setAttribute("manager", manager);
            return "redirect:/index";
            //return new ModelAndView("index");
        }else{
            return "login";
            //return new ModelAndView("login","error","用户名或账户错误");
        }
    }

    //注销
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.invalidate();
        return "login";
    }
}