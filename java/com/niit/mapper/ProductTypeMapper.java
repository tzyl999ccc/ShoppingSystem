package com.niit.mapper;

import com.niit.pojo.ProductType;
import com.niit.pojo.ProductTypeExample;
import com.niit.pojo.vo.ProductTypeVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 86166
 */
public interface ProductTypeMapper {
    int countByExample(ProductTypeExample example);

    int deleteByExample(ProductTypeExample example);

    int deleteByPrimaryKey(Integer typeId);

    int insert(ProductType record);

    int insertSelective(ProductType record);


    List<ProductType> selectByExample(ProductTypeExample example);

    ProductType selectByPrimaryKey(Integer typeId);

    int updateByExampleSelective(@Param("record") ProductType record, @Param("example") ProductTypeExample example);

    int updateByExample(@Param("record") ProductType record, @Param("example") ProductTypeExample example);

    int updateByPrimaryKeySelective(ProductType record);

    int updateByPrimaryKey(ProductType record);

    //实现多条件查询
    public List<ProductType> selectConditionSplitPage(ProductTypeVo vo);

    //批量删除
    public int deleteBatch(String[] typeids);

    List<ProductType> selectAllProductType();
}