package com.test.web;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("error")
public class ErrorController {
    @RequestMapping("404")
    public String handle2(HttpServletRequest request){
        return "404";
    }
}