package com.niit.mapper;


import com.niit.pojo.ProductType;
import com.niit.pojo.User;
import com.niit.pojo.UserExample;
import com.niit.pojo.vo.UserVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 86166
 */
public interface UserMapper {
    int countByExample(UserExample example);

    int deleteByExample(UserExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") User record, @Param("example") UserExample example);

    int updateByExample(@Param("record") User record, @Param("example") UserExample example);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    //实现多条件查询
    List<User> selectConditionUserPage(UserVo vo);

    //批量删除
    public int deleteBatch(String[] userids);

    List<ProductType> selectAllProductType();

    User userLoginYanZeng(@Param("username") String username,@Param("password") String password);
}