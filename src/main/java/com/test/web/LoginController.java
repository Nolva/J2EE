package com.test.web;

import com.test.entity.Administrator;
import com.test.service.AdministratorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;


@Controller
public class LoginController {
    private AdministratorService administratorService;

    @Autowired
    public void setUserService(AdministratorService administratorService) {
        this.administratorService = administratorService;
    }

    @RequestMapping("/tologin")
    public String tologin(){
        System.out.println("ss");
        return "login";
    }

    @RequestMapping("/login")
    public ModelAndView login(HttpServletRequest request, Administrator administrator){
        System.out.println(administrator.getUsername());
        boolean isValidUser=administratorService.hasMatch(administrator.getUsername(),
                administrator.getPassword());
        if (isValidUser){
            request.getSession().setAttribute("administrator",administrator);
            return new ModelAndView("success");
        }else{
            return new ModelAndView("login","error","用户名或账户错误");
        }
    }
}