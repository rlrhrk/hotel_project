package com.hotel.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.dto.RestaurantDTO;
import com.hotel.mapper.RestaurantMapper;

@Service
public class RestaurantService {
	@Autowired
	private RestaurantMapper restaurantmapper;

	public RestaurantService(RestaurantMapper restaurantmapper) {
		this.restaurantmapper = restaurantmapper;
	}

	public List<RestaurantDTO> selectAllRestaurant() {
		return restaurantmapper.selectAllRestaurant();
	}

	public int deleteRestaurant(String restaurantNo) {
		return restaurantmapper.deleteRestaurant(restaurantNo);
	}

	public RestaurantDTO selectOneRestaurant(String restaurantNo) {
		return restaurantmapper.selectOneRestaurant(restaurantNo);
	}

	public int updateRestaurant(RestaurantDTO dto) {
		return restaurantmapper.updateRestaurant(dto);
	}

	public List<RestaurantDTO> selectTypeList() {
		return restaurantmapper.selectTypeList();
	}

	public int insertRestaurant(RestaurantDTO dto) {
		return restaurantmapper.insertRestaurant(dto);
	}
	
	
}
