package com.niit.controller;

import com.alibaba.druid.util.StringUtils;
import com.alibaba.fastjson.JSONObject;
import com.niit.pojo.Car;
import com.niit.pojo.ProductInfoOrder;
import com.niit.pojo.User;
import com.niit.pojo.vo.ProductInfoOrderVo;
import com.niit.pojo.vo.ProductVo;
import com.niit.pojo.vo.UserVo;
import com.niit.service.CarService;
import com.niit.service.ProductInfoOrderService;
import com.niit.service.UserService;
import com.niit.utils.Consts;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static com.niit.utils.OrderNoUtil.getOrderNo;

/**
 * @author 86166
 */
@Controller
@RequestMapping("/order")
public class ProductInfoOrderController {
    public static final int PAGE_SIZE = 5;
    /**异步上传存文件名，增加和更新用这个文件名
     *
     */
    public String saveFileName = "";

    /**请出spring来进行业务 逻辑层对象的注入
     *
     */

    @Autowired
    private ProductInfoOrderService productInfoOrderService;

    @Autowired
    private UserService userService;

    @Autowired
    private CarService carService;

    //分页显示
    @RequestMapping("/productInfoOrderManagement")
    public String split(
            @RequestParam(value = "page", defaultValue = "1")
                    Integer page, Model model) {
        PageInfo info = productInfoOrderService.orderPage(page, PAGE_SIZE);
        model.addAttribute("pb", info);
        List<ProductInfoOrder> list = info.getList();
        for (ProductInfoOrder pd : list){
            Integer user_id = pd.getUserId();
            User user = userService.getUserById(user_id);
            String user_name = user.getUsername();
            pd.setUserName(user_name);
        }
        return "productInfoOrder";
    }

    //分页显示
    @ResponseBody
    @RequestMapping("/ajaxsplit")
    public void ajaxsplit(ProductInfoOrderVo vo, HttpSession session) {
        PageInfo info = productInfoOrderService.productInfoOrderPageVo(vo, PAGE_SIZE);
        session.setAttribute("pb", info);
        //在这里取user_id查username
        List<ProductInfoOrder> list = info.getList();
        for (ProductInfoOrder pd : list){
            Integer user_id = pd.getUserId();
            User user = userService.getUserById(user_id);
            String user_name = user.getUsername();
            pd.setUserName(user_name);
        }
        saveFileName = "";
        return ;
    }

    /**
     * 购物车结算提交，删除购物车里的数据，向订单里添加数据
     */
    @RequestMapping("/addOrder")
    @ResponseBody
    public String addOrder(@RequestBody List<Car> list,Integer userId,Integer productId, HttpServletRequest request){
        JSONObject js = new JSONObject();
        //根据用户id获取用户对象
        User userById = userService.getUserById(userId);
        //如果用户地址为空则需要填写地址
        if(StringUtils.isEmpty(userById.getAddress())){
            js.put(Consts.RES,2);
            return js.toJSONString();
        }
        //获取购物车里的所有商品的id
        List<Integer> ids = new ArrayList<>();
        BigDecimal to = new BigDecimal(0);
        for(Car c:list){
            ids.add(c.getId());
            Car load = carService.selectCar(c.getId());
            //将所有价格变为包装类
            to = to.add(new BigDecimal(load.getPrice()).multiply(new BigDecimal(c.getNum())));
        }
        ProductInfoOrder order = new ProductInfoOrder();
        order.setUserId(userId);
        order.setProductId(productId);
        order.setStatus(0);
        order.setCode(getOrderNo());
        order.setIsdelete(0);
        order.setTotal(to.setScale(2,BigDecimal.ROUND_HALF_UP).toString());
//        order.setUserId(userId);
        order.setAddtime(new Date());
        productInfoOrderService.insertOrderBy(order);
        for(Car c:list){
            //删除购物车
            carService.deleteCarById(c.getId());
        }
        js.put(Consts.RES,1);
        return js.toJSONString();
    }


    /**
     * 取消订单
     */
    @RequestMapping("/qxOrder")
    public String qxOrder(Integer id,Integer userId,Model model){
        ProductInfoOrder obj = productInfoOrderService.getProductInfoOrderById(id);
        obj.setStatus(1);
        productInfoOrderService.updateProductInfoOrder(obj);
        model.addAttribute("obj",obj);

        return "redirect:/user/userOrderView.action?id="+userId+"";
    }

    /**
     * 后台发货
     */
    @RequestMapping("/fh")
    public String fh(Integer id,Model model){
        ProductInfoOrder obj = productInfoOrderService.getProductInfoOrderById(id);
        obj.setStatus(2);
        productInfoOrderService.updateProductInfoOrder(obj);
        model.addAttribute("obj",obj);
        return "redirect:/order/productInfoOrderManagement.action";
    }

    /**
     * 用户收货
     */
    @RequestMapping("/sh")
    public String sh(Integer id,Integer userId,Model model){
        ProductInfoOrder obj = productInfoOrderService.getProductInfoOrderById(id);
        obj.setStatus(3);
        productInfoOrderService.updateProductInfoOrder(obj);
        model.addAttribute("obj",obj);

        return "redirect:/user/userOrderView.action?id="+userId+"";
    }

    //执行删除操作
    @RequestMapping("/delete")
    public String delete(Integer id, HttpSession session) {
        productInfoOrderService.delete(id);
        //增删改后用重定向跳转
        return "redirect:/order/productInfoOrderManagement.action";
    }
}
