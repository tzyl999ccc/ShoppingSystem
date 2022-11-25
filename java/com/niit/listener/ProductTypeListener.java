package com.niit.listener;


import com.niit.pojo.ProductType;
import com.niit.service.ProductTypeService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.util.List;

@WebListener
public class ProductTypeListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        //取出所有的商品类型，便于在增加和更新的页面上使用，或者前端的类型查询中使用
        //切记切记：只能手工从spring的Bean工厂中按名称取出类型的service
        ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext-*.xml");
        ProductTypeService tservice= (ProductTypeService) context.getBean("ProductTypeServiceImpl");
        List<ProductType> list=tservice.getAllType();
        servletContextEvent.getServletContext().setAttribute("ptlist",list);
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}