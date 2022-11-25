package com.niit.mapper;

import com.niit.pojo.ProductInfoOrder;
import com.niit.pojo.ProductInfoOrderExample;
import com.niit.pojo.vo.ProductInfoOrderVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 86166
 */
public interface ProductInfoOrderMapper {
    int countByExample(ProductInfoOrderExample example);

    int deleteByExample(ProductInfoOrderExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ProductInfoOrder record);

    int insertSelective(ProductInfoOrder record);

    List<ProductInfoOrder> selectByExample(ProductInfoOrderExample example);

    ProductInfoOrder selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ProductInfoOrder record, @Param("example") ProductInfoOrderExample example);

    int updateByExample(@Param("record") ProductInfoOrder record, @Param("example") ProductInfoOrderExample example);

    int updateByPrimaryKeySelective(ProductInfoOrder record);

    int updateByPrimaryKey(ProductInfoOrder record);

    //实现多条件查询
    List<ProductInfoOrder> selectConditionProductInfoOrderPage(ProductInfoOrderVo vo);

    //批量删除
    public int deleteBatch(String[] typeids);

    List<ProductInfoOrder> selectProductInfoOrderById(Integer userId);

    List<ProductInfoOrder> selectProductInfoOrderByIdAndStatus0(Integer userId);

    List<ProductInfoOrder> selectProductInfoOrderByIdAndStatus1(Integer userId);

    List<ProductInfoOrder> selectProductInfoOrderByIdAndStatus2(Integer userId);

    List<ProductInfoOrder> selectProductInfoOrderByIdAndStatus3(Integer userId);






}