package com.niit.service.impl;

import com.niit.mapper.ProductInfoMapper;
import com.niit.pojo.ProductInfo;
import com.niit.pojo.ProductInfoExample;
import com.niit.pojo.vo.ProductVo;
import com.niit.service.ProductInfoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * @author 86166
 */
@Service
public class ProductInfoServiceImpl implements ProductInfoService {
    //由spring提供dao层对象的注入
    @Autowired
    private ProductInfoMapper pmapper;

    @Override
    public List<ProductInfo> getAll() {
        return pmapper.selectByExample(new ProductInfoExample());
    }

    @Override
    public ProductInfo getById(Integer pid) {
        return pmapper.selectByPrimaryKey(pid);
    }

    @Override
    public int save(ProductInfo info) {
        return pmapper.insert(info);
    }

    @Override
    public int delete(Integer pid) {
        int num=0;
        try {
            num = pmapper.deleteByPrimaryKey(pid);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return num;
    }

    @Override
    public int update(ProductInfo info) {
        return pmapper.updateByPrimaryKeySelective(info);
    }


    @Override
    public PageInfo splitPage(int page, int pageSize) {
        //商品分页一定会借助于PageHelper类，还要借助于ProductInfoExample
        ProductInfoExample example=new ProductInfoExample();
        //设置的字符串是字段名称和排序规则
        example.setOrderByClause("p_id desc");
        //切记切记：在取集合之前，使用分页工具设置当前页和每页的记录数
        PageHelper.startPage(page,pageSize);
        //取集合
        List<ProductInfo> list=pmapper.selectByExample(example);
        //将查到的集合封装进pageInfo
        PageInfo<ProductInfo> pageInfo=new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public PageInfo<ProductInfo> splitPageVo(ProductVo vo, int pageSize) {
        //切记切记：在取集合之前，使用分页插件一定要先设置当前页和每页的个数
        PageHelper.startPage(vo.getPage(),pageSize);
        //取集合
        List<ProductInfo> list=pmapper.selectConditionSplitPage(vo);

        return new PageInfo<>(list);
    }

    @Override
    public int deleteBatch(String[] pids) {
        return pmapper.deleteBatch(pids);
    }

    @Override
    public PageInfo<ProductInfo> selectByProductName(String pname, int page, int size) {
        //切记切记：在取集合之前，使用分页插件一定要先设置当前页和每页的个数
        PageHelper.startPage(page,size);
        //取集合
        List<ProductInfo> list=pmapper.selectByProductName(pname,page,size);
        return new PageInfo<>(list);
    }

    @Override
    public PageInfo<ProductInfo> selectByMain(int page, int size) {
        //切记切记：在取集合之前，使用分页插件一定要先设置当前页和每页的个数
        PageHelper.startPage(page,size);
        //取集合
        List<ProductInfo> list=pmapper.selectByMain(page,size);
        return new PageInfo<>(list);
    }

    @Override
    public PageInfo<ProductInfo> selectByTypeId(Integer typeId, int page, int size) {
        //切记切记：在取集合之前，使用分页插件一定要先设置当前页和每页的个数
        PageHelper.startPage(page,size);
        //取集合
        List<ProductInfo> list=pmapper.selectByTypeId(typeId, page, size);
        return new PageInfo<>(list);
    }


}