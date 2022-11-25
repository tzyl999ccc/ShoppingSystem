package com.niit.controller;

import com.niit.pojo.ProductType;
import com.niit.pojo.vo.ProductTypeVo;
import com.niit.service.ProductTypeService;
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

/**
 * @author 86166
 */
@Controller
@RequestMapping("/type")
public class ProductTypeController {
    public static final int PAGE_SIZE = 5;

    public String saveFileName = "";
    @Autowired
    private ProductTypeService productTypeService;

    //产品类型分页显示
    @RequestMapping("/productType")
    public String productType(
            @RequestParam(value = "page", defaultValue = "1")
                    Integer page, Model model) {
        PageInfo info = productTypeService.ProductTypePage(page, PAGE_SIZE);
        model.addAttribute("pb", info);
        return "productType";
    }


    //分页显示
    @ResponseBody
    @RequestMapping("/ajaxsplit")
    public void ajaxsplit(ProductTypeVo vo, HttpSession session) {
        PageInfo info = productTypeService.ProductTypePageVo(vo, PAGE_SIZE);
        session.setAttribute("pb", info);
        saveFileName = "";
        return ;
    }

    //删除后分页显示,切记切记切记：坑：使用@ResponseBody注解，返回值不能是String,
    // 如果一定要使用String,则手工封装成JSON格式
    @ResponseBody
    @RequestMapping(value = "/dajaxsplit",produces = "text/html;charset=UTF-8")
    public Object dajaxsplit(ProductTypeVo vo, HttpSession session) {
        PageInfo info = productTypeService.ProductTypePageVo(vo,PAGE_SIZE);
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
    public String delete(Integer typeId, HttpSession session) {
        int num = productTypeService.deleteProductType(typeId);
        if (num > 0) {
            session.setAttribute("msg", "删除成功！");
        } else {
            session.setAttribute("msg", "商品类型不可删除,已经有商品使用此类型！");
        }
        //增删改后用重定向跳转
        return "forward:/type/dajaxsplit.action";
    }

    //执行批量删除操作
    @RequestMapping("/deleteBatch")
    public String deleteBatch(String typeids, HttpSession session) {
        System.out.println(typeids);
        String []ps=typeids.split(",");
        try {
            int num = productTypeService.deleteProductType(ps);
            if (num > 0) {
                session.setAttribute("msg", "删除成功！");
            }
            else {
                session.setAttribute("msg", "删除失败！");
            }
        } catch (Exception e) {

            session.setAttribute("msg","商品类型不可删除,已经有商品使用此类型！");
        }

        //增删改后用重定向跳转
        return "forward:/type/dajaxsplit.action";
    }

    @RequestMapping("/one")
    public String one(Integer typeid,Integer page, Model model) {
        ProductType info = productTypeService.getProductTypeById(typeid);
        model.addAttribute("prod", info);
        model.addAttribute("page",page);
        return "updateType";
    }
    //执行增加操作
    @RequestMapping("/save")
    public String save(ProductType info, HttpServletRequest request) {

        //到此为止，商品对象构建完毕，有自动从表单元素注入的，有上传图片的，有上架日期
        //完成数据库增加操作
        int num = -1;
        try {
            num = productTypeService.saveProductType(info);
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
        return "redirect:/type/productType.action";
    }

    //更新操作
    @RequestMapping("/update")
    public String update(ProductType info,Integer page,HttpServletRequest request) {


        //完成对象更新
        int num = -1;
        try {
            num = productTypeService.updateProductType(info);
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (num > 0) {
            request.getSession().setAttribute("msg", "更新成功！");

        } else {
            request.getSession().setAttribute("msg", "更新失败");
        }
        saveFileName="";
        return "redirect:/type/productType.action?page="+page;
    }

}
