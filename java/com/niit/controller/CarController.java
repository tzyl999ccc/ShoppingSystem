package com.niit.controller;

import com.alibaba.fastjson.JSONObject;
import com.niit.pojo.Car;
import com.niit.service.CarService;
import com.niit.utils.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.math.RoundingMode;

/**
 * @author 86166
 */
@Controller
@RequestMapping("/car")
public class CarController {

    @Autowired
    private CarService carService;

    /**
     * 添加购物车
     */
    @RequestMapping("/carAdd")
    @ResponseBody
    public String carAdd(Car car, HttpServletRequest request) {
        //创建json对象
        JSONObject js = new JSONObject();
        //如果用户为空，则需要先登录
        if(car.getUserId()==null){
            js.put(Consts.RES,1);
            return js.toJSONString();
        }
        Integer num = car.getNum();
        Long price = car.getPrice();
        int t = (int) (num*price);
        //将总价格保留在两位小数
        BigDecimal bg = new BigDecimal(t).setScale(2, RoundingMode.UP);
        double doubleValue = bg.doubleValue();
        car.setTotal(doubleValue+"");
        //加入购物车
        carService.insert(car);
        //返回json数据跳转到购物车界面
        js.put(Consts.RES,0);
        return js.toJSONString();
    }

    /**
     * 删除购物车
     */
    @RequestMapping("/delete")
    @ResponseBody
    public String delete(Integer id){
        carService.deleteCarById(id);
        return "success";
    }
}
