package com.hotel.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hotel.dto.RestaurantDTO;


@Mapper
public interface RestaurantMapper {

	List<RestaurantDTO> selectAllRestaurant();

	int deleteRestaurant(String restaurantNo);

	RestaurantDTO selectOneRestaurant(String restaurantNo);

	int updateRestaurant(RestaurantDTO dto);

	List<RestaurantDTO> selectTypeList();

	int insertRestaurant(RestaurantDTO dto);
	
}
