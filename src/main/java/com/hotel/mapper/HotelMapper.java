package com.hotel.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hotel.dto.HotelDTO;

@Mapper
public interface HotelMapper {

	List<HotelDTO> selectAllHotel();

	int insertHotel(HotelDTO dto);

	HotelDTO selectOneHotel(String hotelNo);
	
	int updateHotel(HotelDTO dto);

	int deleteHotel(String hotelNo);

	int selectAllEa(String hotelNo);


}
