package com.hotel.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hotel.dto.BookingDTO;
import com.hotel.dto.HotelDTO;
import com.hotel.dto.RestaurantDTO;
import com.hotel.dto.RoomDTO;

@Mapper
public interface MainMapper {
	// 메인메이지
	List<RoomDTO> selectMainView();
	// 호텔 소개 페이지
	List<HotelDTO> selectHotelView();
	// 객실 정보 페이지
	List<RoomDTO> selectRoomView();
	// 다이닝 정보 페이지
	List<RestaurantDTO> selectRestaurantView();
	int insertresbookingInfo(RestaurantDTO dto);
	List<RestaurantDTO> selectRestaurantType(String hotelNo);
}
