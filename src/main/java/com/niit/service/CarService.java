package com.niit.service;

import com.niit.pojo.Car;

import java.util.List;

/**
 * @author 86166
 */
public interface CarService {
    int insert(Car record);

    List<Car> selectCarById(Integer id);

    int deleteCarById(Integer id);

    Car selectCar(Integer id);


}
