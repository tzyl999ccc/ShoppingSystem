package com.niit.service.impl;


import com.niit.mapper.CarMapper;
import com.niit.pojo.Car;
import com.niit.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 86166
 */
@Service
public class CarServiceImpl implements CarService {

    @Autowired
    private CarMapper carMapper;


    @Override
    public int insert(Car record) {
        return carMapper.insert(record);
    }

    @Override
    public List<Car> selectCarById(Integer id) {
        return carMapper.selectCarById(id);
    }

    @Override
    public int deleteCarById(Integer id) {
        return carMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Car selectCar(Integer id) {
        return carMapper.selectByPrimaryKey(id);
    }


}
