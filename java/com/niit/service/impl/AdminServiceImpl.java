package com.niit.service.impl;


import com.niit.mapper.AdminMapper;
import com.niit.pojo.Admin;
import com.niit.pojo.AdminExample;
import com.niit.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * @author 86166
 */
@Service
public class AdminServiceImpl implements AdminService {
    //spring框架为你提供mapper实现类的对象
    @Autowired
    private AdminMapper adminMapper;
    @Override
    public String login(String name, String pwd) {
        String s="no";
        //根据用户名查用户对象回来，取出查回来的对象的密码和传来的密码对比，判断登录是否成功
        //创建条件封装的对象AdminExample
        AdminExample example=new AdminExample();
        //将用户名作为条件封装进AdminExample对象
        //将字段"a_name = name"添加到sql语句当中，如果没有这句话默认查找全部数据
        example.createCriteria().andANameEqualTo(name);
        //得到管理员对象
        List<Admin> list=adminMapper.selectByExample(example);
        if(list!=null && list.size()>0){
            Admin admin=list.get(0);
            //判断密码是否相同
            if(pwd.equals(admin.getaPass())){
                //相同返回ok，不相同返回no
                s="ok";
            }
        }
        return s;
    }
}