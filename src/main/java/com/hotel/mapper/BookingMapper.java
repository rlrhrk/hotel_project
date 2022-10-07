package com.hotel.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hotel.dto.BookingDTO;
import com.hotel.dto.HotelDTO;

@Mapper
public interface BookingMapper {
	// 객실 예약
	int insertRoomBooking(BookingDTO bdto);
	// 위시리스트 객실 정보
	List<BookingDTO> selectWishlistView(String email);
	// 예약하려는 객실 정보
	List<BookingDTO> selectBookingView(String roomNo);
	// 찜하기 등록
	int insertWishlist(BookingDTO bdto);
	// 호텔 db 가져옴
	List<HotelDTO> selectHotel();
	// 예약가능 객실 불러옴
	List<BookingDTO> searchRoom(BookingDTO bdto);
}