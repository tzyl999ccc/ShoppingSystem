package com.niit.service.impl;

import com.niit.mapper.ProductInfoOrderMapper;
import com.niit.pojo.*;
import com.niit.pojo.vo.ProductInfoOrderVo;
import com.niit.service.ProductInfoOrderService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 86166
 */
@Service
public class ProductInfoOrderServiceImpl implements ProductInfoOrderService {

    @Autowired
    private ProductInfoOrderMapper productInfoOrderMapper;

    @Override
    public List<ProductInfo> getAll() {
        return null;
    }

    @Override
    public ProductInfoOrder getProductInfoOrderById(Integer userId) {
        return productInfoOrderMapper.selectByPrimaryKey(userId);
    }

    @Override
    public int save(ProductInfo info) {
        return 0;
    }

    @Override
    public int delete(Integer id) {
        return productInfoOrderMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateProductInfoOrder(ProductInfoOrder productInfoOrder) {
        return productInfoOrderMapper.updateByPrimaryKey(productInfoOrder);
    }

    @Override
    public PageInfo orderPage(int page, int pageSize) {
        //商品分页一定会借助于PageHelper类，还要借助于ProductInfoExample
        ProductInfoOrderExample example=new ProductInfoOrderExample();
        //设置的字符串是字段名称和排序规则
        example.setOrderByClause("id desc");
        //切记切记：在取集合之前，使用分页工具设置当前页和每页的记录数
        PageHelper.startPage(page,pageSize);
        //取集合
        List<ProductInfoOrder> list=productInfoOrderMapper.selectByExample(example);
        //将查到的集合封装进pageInfo
        PageInfo<ProductInfoOrder> pageInfo=new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public PageInfo<ProductInfoOrder> productInfoOrderPageVo(ProductInfoOrderVo vo, int pageSize) {
        //切记切记：在取集合之前，使用分页插件一定要先设置当前页和每页的个数
        PageHelper.startPage(vo.getPage(),pageSize);
        //取集合
        List<ProductInfoOrder> list=productInfoOrderMapper.selectConditionProductInfoOrderPage(vo);
        return new PageInfo<>(list);
    }

    @Override
    public int deleteBatch(String[] pids) {
        return 0;
    }

    @Override
    public List<ProductInfoOrder> selectProductInfoOrderById(Integer userId) {
        return productInfoOrderMapper.selectProductInfoOrderById(userId);
    }

    @Override
    public List<ProductInfoOrder> selectProductInfoOrderByIdAndStatus0(Integer userId) {
        return productInfoOrderMapper.selectProductInfoOrderByIdAndStatus0(userId);
    }

    @Override
    public List<ProductInfoOrder> selectProductInfoOrderByIdAndStatus1(Integer userId) {
        return productInfoOrderMapper.selectProductInfoOrderByIdAndStatus1(userId);
    }

    @Override
    public List<ProductInfoOrder> selectProductInfoOrderByIdAndStatus2(Integer userId) {
        return productInfoOrderMapper.selectProductInfoOrderByIdAndStatus2(userId);
    }

    @Override
    public List<ProductInfoOrder> selectProductInfoOrderByIdAndStatus3(Integer userId) {
        return productInfoOrderMapper.selectProductInfoOrderByIdAndStatus3(userId);
    }

    @Override
    public int insertOrderBy(ProductInfoOrder productInfoOrder) {
        return productInfoOrderMapper.insert(productInfoOrder);
    }

}
