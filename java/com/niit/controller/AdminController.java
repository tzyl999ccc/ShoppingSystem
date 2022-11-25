package com.niit.controller;


import com.niit.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * @author 86166
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    /**创建业务逻辑层的对象
     */
    @Autowired
    private AdminService adminService;

    /**
     * 管理员账号密码验证
     */
    @RequestMapping("/login")
    public String login(String name, String pwd, Model model) {
        String s = adminService.login(name, pwd);
        if ("ok".equals(s)) {
            model.addAttribute("name", name);
            return "main";
        } else {
            model.addAttribute("errmsg", "用户名或密码不正确！");
            return "login";
        }
    }

    /**
     * 跳转到错误界面
     */
    @RequestMapping("/err")
    public String err() {
        return "err";
    }

    /**
     * 管理员退出
     */
    @RequestMapping("/logout")
    public String logout(HttpServletResponse response, HttpSession session) {
        //清空cookie
        Cookie c1=new Cookie("aName","1");
        c1.setMaxAge(0);
        response.addCookie(c1);
        Cookie c2=new Cookie("aPass","1");
        c2.setMaxAge(0);
        response.addCookie(c2);
        //销毁session
        session.invalidate();
        //跳转到首页
        //借助springmvc来重定向,response.sendRedirect("/crm/");
        return "redirect:/admin/login.jsp";
    }

}