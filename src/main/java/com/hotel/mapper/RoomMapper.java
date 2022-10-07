package com.hotel.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hotel.dto.RoomDTO;

@Mapper
public interface RoomMapper {

	List<RoomDTO> selectAllRoom();

	List<RoomDTO> selectRoomOption(String roomNo);

	RoomDTO selectOneRoom(String roomNo);

	String selectHotelName(String hotelNo);

	List<RoomDTO> selectHotelList();

	int updateRoom(RoomDTO dto);

	int updateRoomImage(RoomDTO dto);

	List<RoomDTO> selectInsertRoomOption(String roomNo);

	int resetRoomOption(String roomNo);

	int insertRoomOption(Map<String, String> map);

	List<RoomDTO> allOptionList();

	int insertRoom(RoomDTO dto);

	int insertRoomImage(RoomDTO dto);

	int deleteOption(String optionName);

	int setOption(Map<String, String> map);
	
	int deleteRoom(String roomNo);

}
