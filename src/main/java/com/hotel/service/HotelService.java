package com.hotel.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hotel.dto.HotelDTO;
import com.hotel.mapper.HotelMapper;

@Service
public class HotelService {
	private HotelMapper hotelmapper;

	public HotelService(HotelMapper hotelmapper) {
		this.hotelmapper = hotelmapper;
	}

	public List<HotelDTO> selectAllHotel() {
		return hotelmapper.selectAllHotel();
	}

	public int insertHotel(HotelDTO dto) {
		return hotelmapper.insertHotel(dto);
	}

	public HotelDTO selectOneHotel(String hotelNo) {
		return hotelmapper.selectOneHotel(hotelNo);
	}

	public int updateHotel(HotelDTO dto) {
		return hotelmapper.updateHotel(dto);
	}

	public int deleteHotel(String hotelNo) {
		return hotelmapper.deleteHotel(hotelNo);
	}

	public int selectAllEa(String hotelNo) {
		return hotelmapper.selectAllEa(hotelNo);
	}
	
	
	
}
