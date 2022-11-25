package com.niit.mapper;

import com.niit.pojo.ProductInfo;
import com.niit.pojo.ProductInfoExample;
import com.niit.pojo.vo.ProductVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 86166
 */
public interface ProductInfoMapper {
    int countByExample(ProductInfoExample example);

    int deleteByExample(ProductInfoExample example);

    int deleteByPrimaryKey(Integer pId);

    int insert(ProductInfo record);

    int insertSelective(ProductInfo record);

    List<ProductInfo> selectByExample(ProductInfoExample example);

    ProductInfo selectByPrimaryKey(Integer pId);

    int updateByExampleSelective(@Param("record") ProductInfo record, @Param("example") ProductInfoExample example);

    int updateByExample(@Param("record") ProductInfo record, @Param("example") ProductInfoExample example);

    int updateByPrimaryKeySelective(ProductInfo record);

    int updateByPrimaryKey(ProductInfo record);

    //实现多条件查询
    public List<ProductInfo> selectConditionSplitPage(ProductVo vo);

    //批量删除
    public int deleteBatch(String[] pids);

    //实现根据用户名条件查询
    List<ProductInfo> selectByProductName(@Param("pname") String pname,int page,int size);

    //实现根据用户名条件查询
    List<ProductInfo> selectByMain(int page,int size);

    //实现根据用户名条件查询
    List<ProductInfo> selectByTypeId(@Param("typeId") Integer typeId,int page,int size);




}