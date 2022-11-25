package com.niit.service.impl;


import com.niit.mapper.ProductTypeMapper;
import com.niit.pojo.ProductType;
import com.niit.pojo.ProductTypeExample;
import com.niit.pojo.vo.ProductTypeVo;
import com.niit.service.ProductTypeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * @author 86166
 */
@Service("ProductTypeServiceImpl")
public class ProductTypeServiceImpl implements ProductTypeService {
    //必有数据访问层的mapper对象

    @Autowired
    private ProductTypeMapper typeMapper;

    @Override
    public List<ProductType> getAllType() {
        return typeMapper.selectByExample(new ProductTypeExample());
    }

    @Override
    public List<ProductType> selectAllProductType() {
        return typeMapper.selectAllProductType();
    }


    @Override
    public ProductType getProductTypeById(Integer typeId) {
        return typeMapper.selectByPrimaryKey(typeId);
    }

    @Override
    public int saveProductType(ProductType info) {
        return typeMapper.insert(info);
    }

    @Override
    public int deleteProductType(Integer typeId) {
        int num=0;
        try {
            num = typeMapper.deleteByPrimaryKey(typeId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return num;
    }

    @Override
    public int updateProductType(ProductType info) {
        return typeMapper.updateByPrimaryKeySelective(info);
    }

    @Override
    public PageInfo ProductTypePage(int page, int pageSize) {
        //商品分页一定会借助于PageHelper类，还要借助于ProductInfoExample
        ProductTypeExample example=new ProductTypeExample();
        //设置的字符串是字段名称和排序规则
        example.setOrderByClause("type_id desc");
        //切记切记：在取集合之前，使用分页工具设置当前页和每页的记录数
        PageHelper.startPage(page,pageSize);
        //取集合
        List<ProductType> list=typeMapper.selectByExample(example);
        //将查到的集合封装进pageInfo
        PageInfo<ProductType> pageInfo=new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public PageInfo<ProductType> ProductTypePageVo(ProductTypeVo vo, int pageSize) {
        //切记切记：在取集合之前，使用分页插件一定要先设置当前页和每页的个数
        PageHelper.startPage(vo.getPage(),pageSize);
        //取集合
        List<ProductType> list=typeMapper.selectConditionSplitPage(vo);

        return new PageInfo<>(list);
    }

    @Override
    public int deleteProductType(String[] typeIds) {
        return typeMapper.deleteBatch(typeIds);
    }
}
