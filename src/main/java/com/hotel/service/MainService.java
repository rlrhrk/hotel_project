package com.hotel.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hotel.dto.BookingDTO;
import com.hotel.dto.HotelDTO;
import com.hotel.dto.RestaurantDTO;
import com.hotel.dto.RoomDTO;
import com.hotel.mapper.MainMapper;

@Service
public class MainService {
	private MainMapper mainmapper;

	public MainService(MainMapper mainmapper) {
		this.mainmapper = mainmapper;
	}

	public List<RoomDTO> selectMainView() {
		return mainmapper.selectMainView();
	}

	public List<HotelDTO> selectHotelView() {
		return mainmapper.selectHotelView();
	}

	public List<RoomDTO> selectRoomView() {
		return mainmapper.selectRoomView();
	}
	
	public List<RestaurantDTO> selectRestaurantView() {
		return mainmapper.selectRestaurantView();
	}
	
	public int insertresbookingInfo(RestaurantDTO dto) {
		return mainmapper.insertresbookingInfo(dto);
	}

	public List<RestaurantDTO> selectRestaurantType(String hotelNo) {
		return mainmapper.selectRestaurantType(hotelNo);
	}
}
