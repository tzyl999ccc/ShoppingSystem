package com.niit.service;

import com.niit.pojo.ProductType;

import com.niit.pojo.User;
import com.niit.pojo.vo.UserVo;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @author 86166
 */
public interface UserService {
    /**完成查询全部商品类型的功能
     *
     */
    List<User> getAllUser();



    List<ProductType> selectAllProductType();


    /**根据主键查商品类型
     *
     */
    User getUserById(Integer userId);

    /**
     * 增加用户
     */
    int saveUser(User user);

    /**
     * 删除用户
     */
    int deleteUser(Integer Id);

    /**修改用户
     *
     * @param user
     * @return
     */
    int updateUser(User user);

    /**分页
     *
     * @param page
     * @param pageSize
     * @return
     */
    PageInfo userPage(int page, int pageSize);

    /**多条件分页查询
     *
     * @param vo
     * @param pageSize
     * @return
     */
    PageInfo<User> userPageVo(UserVo vo, int pageSize);

    /**批量删除商品类型
     *
     * @param userIds
     * @return
     */
    int deleteUserBatch(String[] userIds);

    User userLoginYanZeng(String username, String password);
}
