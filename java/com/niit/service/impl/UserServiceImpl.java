package com.niit.service.impl;

import com.niit.mapper.UserMapper;
import com.niit.pojo.ProductType;
import com.niit.pojo.User;
import com.niit.pojo.UserExample;
import com.niit.pojo.vo.UserVo;
import com.niit.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 86166
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> getAllUser() {
        return userMapper.selectByExample(new UserExample());
    }

    @Override
    public List<ProductType> selectAllProductType() {
        return null;
    }

    @Override
    public User getUserById(Integer userId) {
        return userMapper.selectByPrimaryKey(userId);
    }

    @Override
    public int saveUser(User user) {
        return userMapper.insert(user);
    }

    @Override
    public int deleteUser(Integer id) {
        return userMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public PageInfo userPage(int page, int pageSize) {
        //商品分页一定会借助于PageHelper类，还要借助于ProductInfoExample
        UserExample example=new UserExample();
        //设置的字符串是字段名称和排序规则
        example.setOrderByClause("id desc");
        //切记切记：在取集合之前，使用分页工具设置当前页和每页的记录数
        PageHelper.startPage(page,pageSize);
        //取集合
        List<User> list=userMapper.selectByExample(example);
        //将查到的集合封装进pageInfo
        PageInfo<User> pageInfo=new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public PageInfo<User> userPageVo(UserVo vo, int pageSize) {
        //切记切记：在取集合之前，使用分页插件一定要先设置当前页和每页的个数
        PageHelper.startPage(vo.getPage(),pageSize);
        //取集合
        List<User> list=userMapper.selectConditionUserPage(vo);
        return new PageInfo<>(list);
    }

    @Override
    public int deleteUserBatch(String[] userIds) {
        return userMapper.deleteBatch(userIds);
    }

    @Override
    public User userLoginYanZeng(String username, String password) {
        return userMapper.userLoginYanZeng(username, password);
    }
}
