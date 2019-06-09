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
    private static int MANAGER_PAGE_SIZE = 5;

    @Autowired
    public void setUserService(ManagerService managerService) {
        this.managerService = managerService;
    }

    //查看所有管理员
    @RequestMapping("/show")
    public ModelAndView show(String page, Model model){
//        for(Manager manager : managerService.ListManager()) {
//            System.out.println(manager.getManagerId());
//            System.out.println(manager.getManPassword());
//        }
        // 数据量大，不应该使用Session存储
//        request.getSession().setAttribute("managerList", managerService.ListManager());
        //request.setAttribute("managerList", managerService.ListManager());
        //总管理员数
        List<Manager> managerList = managerService.ListManager();
        //request.setAttribute("totalCount", managerList.size());
        model.addAttribute("totalCount", managerList.size());
        //总页数
        int totalPage;
        if(managerList.size()%MANAGER_PAGE_SIZE == 0) {
            totalPage = managerList.size()/MANAGER_PAGE_SIZE;
        }else{
            totalPage = managerList.size()/MANAGER_PAGE_SIZE + 1;
        }
        //request.setAttribute("totalPage", pageTimes);
        model.addAttribute("totalPage", totalPage);
        //页面初始的时候page没有值
        if (page == null)
            page = "1";
        //每页开始的第几条记录
        int startRow = (Integer.parseInt(page)-1) * MANAGER_PAGE_SIZE;
        managerList = managerService.ListManagerByPage(startRow, MANAGER_PAGE_SIZE);
        //System.out.print("page: "+page+" startrow:"+startRow);
        //request.setAttribute("currentPage", Integer.parseInt(page));
        model.addAttribute("currentPage", Integer.parseInt(page));
        //request.setAttribute("managerList", managerList);
        model.addAttribute("managerList", managerList);

        //return "index";
        return new ModelAndView("index");
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
