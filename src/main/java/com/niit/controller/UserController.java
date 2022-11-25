package com.niit.controller;

import com.niit.pojo.ProductInfo;
import com.niit.pojo.ProductInfoOrder;
import com.niit.pojo.ProductType;
import com.niit.pojo.User;
import com.niit.pojo.vo.ProductVo;
import com.niit.pojo.vo.UserVo;
import com.niit.service.ProductInfoOrderService;
import com.niit.service.UserService;
import com.github.pagehelper.PageInfo;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * @author 86166
 */
@Controller
@RequestMapping("/user")
public class UserController {

    public static final int PAGE_SIZE = 5;
    /**异步上传存文件名，增加和更新用这个文件名
     *
     */
    public String saveFileName = "";

    /**请出spring来进行业务 逻辑层对象的注入
     *
     */

    @Autowired
    private UserService userService;

    @Autowired
    private ProductInfoOrderService productInfoOrderService;

    //分页显示
    @RequestMapping("/userManagement")
    public String split(
            @RequestParam(value = "page", defaultValue = "1")
                    Integer page, Model model) {
        PageInfo info = userService.userPage(page, PAGE_SIZE);
        model.addAttribute("pb", info);
        return "user";
    }

    //分页显示
    @ResponseBody
    @RequestMapping("/ajaxsplit")
    public void ajaxsplit(UserVo vo, HttpSession session) {
        PageInfo info = userService.userPageVo(vo, PAGE_SIZE);
        session.setAttribute("pb", info);
        saveFileName = "";
        return ;
    }

    //删除后分页显示,切记切记切记：坑：使用@ResponseBody注解，返回值不能是String,
    // 如果一定要使用String,则手工封装成JSON格式
    @ResponseBody
    @RequestMapping(value = "/dajaxsplit",produces = "text/html;charset=UTF-8")
    public Object dajaxsplit(UserVo vo, HttpSession session) {
        PageInfo info = userService.userPageVo(vo, PAGE_SIZE);
        session.setAttribute("pb", info);
        saveFileName = "";

        //手工封装返回删除成功或删除失败字符串为JSON格式
        String s=session.getAttribute("msg").toString();
        JSONObject object=new JSONObject();
        object.put("msg",s);
        return object.toString();
    }

    //执行删除操作
    @RequestMapping("/delete")
    public String delete(Integer id, HttpSession session) {
        List<ProductInfoOrder> productInfoOrders = productInfoOrderService.selectProductInfoOrderById(id);
        if(productInfoOrders.size()==0){
            int num = userService.deleteUser(id);
            if (num > 0) {
                session.setAttribute("msg", "删除成功！");
            } else {
                session.setAttribute("msg", "商品类型不可删除,已经有商品使用此类型！");
            }
        }else{
            session.setAttribute("msg", "用户不可删除,此用户还有订单！");
        }

        //增删改后用重定向跳转
        return "forward:/user/dajaxsplit.action";
    }
    //执行批量删除操作
    @RequestMapping("/deleteUser")
    public String deleteBatch(String userIds, HttpSession session) {
        String []ps=userIds.split(",");
        try {
            int num = userService.deleteUserBatch(ps);
            if (num > 0) {
                session.setAttribute("msg", "删除成功！");
            }
            else {
                session.setAttribute("msg", "删除失败！");
            }
        } catch (Exception e) {
            session.setAttribute("msg","用户不可删除！");
        }

        //增删改后用重定向跳转
        return "forward:/user/dajaxsplit.action";
    }

    @RequestMapping("/one")
    public String one(Integer id,Integer page, Model model) {
        User info = userService.getUserById(id);
        model.addAttribute("prod", info);
        model.addAttribute("page",page);
        return "updateUser";
    }

    //更新操作
    @RequestMapping("/update")
    public String update(User user, Integer page, HttpServletRequest request) {
        //完成对象更新
        int num = -1;
        try {
            num = userService.updateUser(user);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (num > 0) {
            request.getSession().setAttribute("msg", "更新成功！");

        } else {
            request.getSession().setAttribute("msg", "更新失败");
        }
        saveFileName="";
        return "redirect:/user/userManagement.action?page="+page;
    }

    //执行增加操作
    @RequestMapping("/save")
    public String save(User user, HttpServletRequest request) {
        //完成数据库增加操作
        int num = -1;
        try {
            num = userService.saveUser(user);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (num > 0) {
            request.getSession().setAttribute("msg", "增加成功！");
        }
        else {
            request.getSession().setAttribute("msg", "增加失败!");
        }
        saveFileName="";
        //增删改后用重定向跳转
        return "redirect:/user/userManagement.action";
    }
}
