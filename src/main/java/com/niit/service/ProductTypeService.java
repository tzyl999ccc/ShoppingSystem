package com.niit.service;



import com.niit.pojo.ProductType;
import com.niit.pojo.vo.ProductTypeVo;
import com.github.pagehelper.PageInfo;

import java.util.List;


/**
 * @author 86166
 */
public interface ProductTypeService {
    /**完成查询全部商品类型的功能
     *
     */
    List<ProductType> getAllType();



    List<ProductType> selectAllProductType();


    /**根据主键查商品类型
     *
     */
    ProductType getProductTypeById(Integer typeId);

    /**
     * 增加商品类型
     */
    int saveProductType(ProductType info);

    /**
     * 删除商品类型
     */
    int deleteProductType(Integer typeId);

    /**修改商品类型
     *
     * @param info
     * @return
     */
    int updateProductType(ProductType info);

    /**分页
     *
     * @param page
     * @param pageSize
     * @return
     */
    PageInfo ProductTypePage(int page, int pageSize);

    /**多条件分页查询
     *
     * @param vo
     * @param pageSize
     * @return
     */
    PageInfo<ProductType> ProductTypePageVo(ProductTypeVo vo, int pageSize);

    /**批量删除商品类型
     *
     * @param typeIds
     * @return
     */
    int deleteProductType(String[] typeIds);




}
