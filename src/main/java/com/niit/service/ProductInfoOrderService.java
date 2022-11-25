package com.niit.service;

import com.niit.pojo.ProductInfo;
import com.niit.pojo.ProductInfoOrder;
import com.niit.pojo.vo.ProductInfoOrderVo;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @author 86166
 */
public interface ProductInfoOrderService {
    //查所有
    public List<ProductInfo> getAll();
    //根据主键查商品
    ProductInfoOrder getProductInfoOrderById(Integer userId);
    //增加
    public int save(ProductInfo info);
    //删除
    public int delete(Integer id);
    //修改
    public int updateProductInfoOrder(ProductInfoOrder productInfoOrder);
    //分页
    PageInfo orderPage(int page, int pageSize);
    //多条件分页查询
    PageInfo<ProductInfoOrder> productInfoOrderPageVo(ProductInfoOrderVo vo, int pageSize);
    //批量删除
    public int deleteBatch(String[] pids);

    List<ProductInfoOrder> selectProductInfoOrderById(Integer userId);

    List<ProductInfoOrder> selectProductInfoOrderByIdAndStatus0(Integer userId);

    List<ProductInfoOrder> selectProductInfoOrderByIdAndStatus1(Integer userId);

    List<ProductInfoOrder> selectProductInfoOrderByIdAndStatus2(Integer userId);

    List<ProductInfoOrder> selectProductInfoOrderByIdAndStatus3(Integer userId);

    int insertOrderBy(ProductInfoOrder productInfoOrder);

}
