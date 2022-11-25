package com.niit.controller;

import com.niit.pojo.*;
import com.niit.pojo.vo.ProductVo;
import com.niit.service.*;
import com.github.pagehelper.PageInfo;
import com.niit.utils.Contants;
import com.niit.utils.ReturnObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * @author 86166
 */
@Controller
@RequestMapping("/user")
public class UserMainViewController {

    public static final int PAGE_SIZE = 10;

    @Autowired
    private ProductTypeService productTypeService;


    @Autowired
    private ProductInfoService productInfoService;

    @Autowired
    private UserService userService;

    @Autowired
    private ProductInfoService pservice;

    @Autowired
    private ProductInfoOrderService productInfoOrderService;


    @Autowired
    private CarService carService;

    /**
     *跳转到用户主界面
     */
    @RequestMapping("/userMain")
    public String userMainViewIndex(@RequestParam(value = "page", defaultValue = "1")
                                                Integer page,Model model){
        List<ProductType> allType = productTypeService.getAllType();
        PageInfo info = pservice.splitPage(page, PAGE_SIZE);
        PageInfo info2 = pservice.splitPage(page, 5);
        model.addAttribute("allType",allType);
        model.addAttribute("pb",info);
        model.addAttribute("pb2",info2);
        return "index";
    }

    /**
     * 按关键字或者二级分类查询
     */
    @RequestMapping("/shoplist")
    public String shoplist() {
        return "list";
    }

    /**
     *根据条件查询并且跳转到查询界面
     */
    @RequestMapping("/searchlist")
    public String searchlist(Map<String,Object> map,ProductVo vo, HttpSession session,Model model,
                             @RequestParam(defaultValue = "1") int page,//设置接收参数并默认值
                             @RequestParam(defaultValue = "5") int size) {
        String pName = vo.getPname();
        PageInfo pageInfos = pservice.selectByProductName(pName,page,size);
        map.put("pageInfos", pageInfos);
        session.setAttribute("pName",pName);
        return "search_List";
    }

    /**
     *查询界面分页
     */
    @RequestMapping("/productInfo_location_list")
    public String searchListInfo(Map<String,Object> map,ProductVo vo, HttpSession session,
                             @RequestParam(defaultValue = "1") int page,//设置接收参数并默认值
                             @RequestParam(defaultValue = "5") int size) {
        String pname = vo.getPname();
        PageInfo pageInfos = pservice.selectByProductName(pname,page,size);
        map.put("pageInfos", pageInfos);
        return "search_List";
    }

    /**
     *产品类型界面
     */
    @RequestMapping("/typeShopList")
    public String typeShopList(Map<String,Object> map,Integer typeId, HttpSession session,Model model,
                             @RequestParam(defaultValue = "1") int page,//设置接收参数并默认值
                             @RequestParam(defaultValue = "5") int size) {
        PageInfo pageInfos = pservice.selectByTypeId(typeId, page, size);
        map.put("pageInfos", pageInfos);
        session.setAttribute("typeId",typeId);
        return "type_List";
    }

    /**
     *产品类型界面分页
     */
    @RequestMapping("/productInfo_type_list")
    public String typeListInfo(Map<String,Object> map,Integer typeId, HttpSession session,
                                 @RequestParam(defaultValue = "1") int page,//设置接收参数并默认值
                                 @RequestParam(defaultValue = "5") int size) {
        PageInfo pageInfos = pservice.selectByTypeId(typeId, page, size);
        map.put("pageInfos", pageInfos);
        return "type_List";
    }

    /**
     *主界面分页
     */
    @RequestMapping("/productInfo_main_list")
    public String searchMainListInfo(Map<String,Object> map,ProductVo vo, HttpSession session,Model model,
                                 @RequestParam(defaultValue = "1") int page,//设置接收参数并默认值
                                 @RequestParam(defaultValue = "10") int size) {
        List<ProductType> allType = productTypeService.getAllType();
        PageInfo pageInfos = pservice.selectByMain(page, size);
        model.addAttribute("allType",allType);
        map.put("pb", pageInfos);
//        return "index";
        return "forward:/user/userMain.action";
    }


    /**
     * 查看货物详细信息
     */
    @RequestMapping("/detailView")
    public String detailViewIndex(Integer pId,Model model){
        ProductInfo obj = productInfoService.getById(pId);
        model.addAttribute("obj",obj);
        return "detail";
    }

    /**
     * 查看购物车
     */
    @RequestMapping("/userCarView")
    public String userCarViewIndex(Integer id,Model model, HttpServletRequest request){
        //根据用户id查询订单
        List<Car> list = carService.selectCarById(id);
        model.addAttribute("list",list);
        for (Car car : list){
            Integer productId = car.getProductId();
            ProductInfo byId = productInfoService.getById(productId);
            //在car对象里封装拼接的属性
            car.setProductName(byId.getpName());
            car.setProductPrice(byId.getpPrice());
            car.setProductImage(byId.getpImage());
        }
        return "car";
    }



    /**
     *订单类
     */
    @RequestMapping("/userOrderView")
    public String userOrderViewIndex(Integer id,Model model, HttpServletRequest request){
        //全部订单
        List<ProductInfoOrder> all = productInfoOrderService.selectProductInfoOrderById(id);
        model.addAttribute("all",all);
        for (ProductInfoOrder pd : all){
            Integer productId = pd.getProductId();
            ProductInfo byId = productInfoService.getById(productId);
            pd.setProductName(byId.getpName());
            pd.setProductPrice(byId.getpPrice());
            pd.setProductImage(byId.getpImage());
        }
        //代发货
        List<ProductInfoOrder> dfh = productInfoOrderService.selectProductInfoOrderByIdAndStatus0(id);
        model.addAttribute("dfh",dfh);
        for (ProductInfoOrder pd : dfh){
            Integer productId = pd.getProductId();
            ProductInfo byId = productInfoService.getById(productId);
            pd.setProductName(byId.getpName());
            pd.setProductPrice(byId.getpPrice());
            pd.setProductImage(byId.getpImage());
        }
        //已取消
        List<ProductInfoOrder> yqx = productInfoOrderService.selectProductInfoOrderByIdAndStatus1(id);
        model.addAttribute("yqx",yqx);
        for (ProductInfoOrder pd : yqx){
            Integer productId = pd.getProductId();
            ProductInfo byId = productInfoService.getById(productId);
            pd.setProductName(byId.getpName());
            pd.setProductPrice(byId.getpPrice());
            pd.setProductImage(byId.getpImage());
        }
        //已发货
        List<ProductInfoOrder> dsh = productInfoOrderService.selectProductInfoOrderByIdAndStatus2(id);
        model.addAttribute("dsh",dsh);
        for (ProductInfoOrder pd : dsh){
            Integer productId = pd.getProductId();
            ProductInfo byId = productInfoService.getById(productId);
            pd.setProductName(byId.getpName());
            pd.setProductPrice(byId.getpPrice());
            pd.setProductImage(byId.getpImage());
        }
        //已收货
        List<ProductInfoOrder> ysh = productInfoOrderService.selectProductInfoOrderByIdAndStatus3(id);
        model.addAttribute("ysh",ysh);
        for (ProductInfoOrder pd : ysh){
            Integer productId = pd.getProductId();
            ProductInfo byId = productInfoService.getById(productId);
            pd.setProductName(byId.getpName());
            pd.setProductPrice(byId.getpPrice());
            pd.setProductImage(byId.getpImage());
        }
        return "user_center_order";
    }

    /**
     *用户中心
     */
    @RequestMapping("/userCenterView")
    public String userCenterViewIndex(Integer id,Model model, HttpServletRequest request){
        if(id==null){
            return "redirect:/user/userLoginView.action";
        }
        User userById = userService.getUserById(id);
        model.addAttribute("obj",userById);
        return "user_center_info";
    }


    /**
     * 执行修改用户信息的操作
     */
    @RequestMapping("/userUpdate")
    public String userUpdate(User user,HttpServletRequest request){
        userService.updateUser(user);
        return "redirect:/user/userCenterView.action?id="+user.getId()+"";
    }

    /**
     * 执行修改用户密码的操作
     */
    @RequestMapping("/userUpdatePassword")
    public String userUpdatePassword(User user,HttpServletRequest request){
        userService.updateUser(user);
        return "redirect:/user/userCenterView.action?id="+user.getId()+"";
    }


    @RequestMapping("/userLoginView")
    public String userLoginViewIndex(){
        return "UserLogin";
    }

    @RequestMapping("/registerView")
    public String userRegisterViewIndex(){
        return "register";
    }


    /**
     *用户注册
     */
    @RequestMapping("/registerUser")
    public String userRegister(User user){
        System.out.println(user);
        int i = userService.saveUser(user);
        if (i==1){
            System.out.println("插入成功");
        }
        return "register";
    }


    /**
     *用户登录验证
     */
    @RequestMapping("/userLoginYanZeng")
    @ResponseBody
    public Object userLoginYanZeng(String username,String password,HttpSession session) {
        User user = userService.userLoginYanZeng(username, password);
        ReturnObject returnObject=new ReturnObject();
        if(user == null){
            returnObject.setCode(Contants.RETURN_OBJECT_CODE_FAIL);

//            return "redirect:/user/registerView.action";
        }else {
            Integer userId = user.getId();
            String UserName = user.getUsername();
            session.setAttribute("userId",userId);
            session.setAttribute("UserName",UserName);
            returnObject.setCode("1");
//            return "redirect:/user/userMain.action";
        }
        return returnObject;
    }

    /**前端用户退出*/
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/user/userMain.action";
    }
}
