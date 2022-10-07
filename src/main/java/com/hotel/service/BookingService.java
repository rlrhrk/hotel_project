package com.hotel.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hotel.dto.BookingDTO;
import com.hotel.dto.HotelDTO;
import com.hotel.mapper.BookingMapper;

@Service
public class BookingService {
	private BookingMapper bookingmapper;

	public BookingService(BookingMapper bookingmapper) {
		this.bookingmapper = bookingmapper;
	}
	// 객실예약
	public int insertRoomBooking(BookingDTO bdto) {
		return bookingmapper.insertRoomBooking(bdto);
	}
	// 위시리스트
	public List<BookingDTO> selectWishlistView(String email) {
		return bookingmapper.selectWishlistView(email);
	}
	
	// 예약할 객실
	public List<BookingDTO> selectBookingView(String roomNo) {
		return bookingmapper.selectBookingView(roomNo);
	}
	
	// 호텔 정보
	public List<HotelDTO> selectHotel() {
		return bookingmapper.selectHotel();
	}
	
	// 객실 검색
	public List<BookingDTO> searchRoom(BookingDTO bdto) {
		return bookingmapper.searchRoom(bdto);
	}
	
	// 찜하기 등록
//	public int insertWishlist(String email, String roomNo) {
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("email", email);
//		map.put("roomNo", roomNo);
//		return bookingmapper.insertWishlist(map);
//	}
	public int insertWishlist(BookingDTO bdto) {
		return bookingmapper.insertWishlist(bdto);
	}
	
}
