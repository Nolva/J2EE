package com.test.web;

import com.test.entity.Manager;
import com.test.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;


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
        String page = request.getParameter("page") == null?"1":request.getParameter("page");//获取页码，默认1

        request.setAttribute("totalCount", managerService.getManagerNum());
        request.setAttribute("totalPage", managerService.getTotalPage());
        request.setAttribute("currentPage", Integer.parseInt(page));
        request.setAttribute("managerList", managerService.ListManagerByPage(Integer.parseInt(page)-1));

        return "index";
    }

    //修改管理员信息
    @RequestMapping("/change")
    public String change(HttpServletRequest request, Manager manager) {

        HttpSession session = request.getSession();
//        response.setContentType("text/html; charset=utf-8");
//        PrintWriter out = response.getWriter();

        if (session.getAttribute("manager") != null) {
            Manager SessionManager = (Manager) session.getAttribute("manager");
//            System.out.println(SessionManager.getManPer());
            //如果不是超级管理员
            if (!managerService.isSuperManager(SessionManager.getManagerId())) {
                //out.print("<script>alert('您不是超级管理员，操作失败！');window.location.href='/administrator/show';</script>");
                request.setAttribute("message", "您不是超级管理员，操作失败！");
                return "managerMessage";
            } else {
                boolean isUpdate = managerService.UpdateManagerInfo(manager);
                if (!isUpdate) {
                    request.setAttribute("message", "更新管理员信息失败！");
                    return "managerMessage";
                }
                request.setAttribute("message", "更新管理员信息成功！");
                return "managerMessage";
            }
        }

        return "redirect:/administrator/show";
    }

    //删除管理员
    @RequestMapping("/delete")
    public String delete(HttpServletRequest request, Manager manager) {

        HttpSession session = request.getSession();

        if (session.getAttribute("manager") != null) {
            Manager SessionManager = (Manager) session.getAttribute("manager");
            if (!managerService.isSuperManager(SessionManager.getManagerId())){
                request.setAttribute("message", "您不是超级管理员，操作失败！");
                return "managerMessage";
            }else {
                boolean isDelete = managerService.DeleteManager(manager.getManagerId());
                if (!isDelete){
                    request.setAttribute("message", "无法删除超级管理员！");
                }else {
                    request.setAttribute("message", "删除管理员成功！");
                }
                return "managerMessage";
            }
        }

        return "redirect:/administrator/show";
    }

    //添加管理员
    @RequestMapping("/add")
    public String add(HttpServletRequest request, Manager manager) {

        HttpSession session = request.getSession();

        if (session.getAttribute("manager") != null) {
            Manager SessionManager = (Manager) session.getAttribute("manager");
            if (!managerService.isSuperManager(SessionManager.getManagerId())){
                request.setAttribute("message", "您不是超级管理员，操作失败！");
                return "managerMessage";
            }else {
                int isAdd = managerService.AddManager(manager);
                if (isAdd == -1){
                    request.setAttribute("message", "添加管理员失败！");
                }else if (isAdd == 1){
                    request.setAttribute("message", "管理员ID已存在，添加失败！");
                }else{
                    request.setAttribute("message", "添加管理员成功！");
                }
                return "managerMessage";
            }
        }

        return "redirect:/administrator/show";
    }
}
