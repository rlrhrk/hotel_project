package com.hotel.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hotel.dto.HotelDTO;
import com.hotel.dto.RoomDTO;
import com.hotel.mapper.RoomMapper;

@Service
public class RoomService {
	private RoomMapper roommapper;

	public RoomService(RoomMapper roommapper) {
		this.roommapper = roommapper;
	}

	public List<RoomDTO> selectAllRoom() {
		return roommapper.selectAllRoom();
	}

	public List<RoomDTO> selectRoomOption(String roomNo) {
		return roommapper.selectRoomOption(roomNo);
	}

	public RoomDTO selectOneRoom(String roomNo) {
		return roommapper.selectOneRoom(roomNo);
	}

	public String selectHotelName(String hotelNo) {
		return roommapper.selectHotelName(hotelNo);
	}

	public List<RoomDTO> selectHotelList() {
		return roommapper.selectHotelList();
	}

	public int updateRoom(RoomDTO dto) {
		return roommapper.updateRoom(dto);
	}

	public int updateRoomImage(RoomDTO dto) {
		return roommapper.updateRoomImage(dto);
	}

	public List<RoomDTO> selectInsertRoomOption(String roomNo) {
		return roommapper.selectInsertRoomOption(roomNo);
	}

	public int resetRoomOption(String roomNo) {
		return roommapper.resetRoomOption(roomNo);
	}

	public int insertRoomOption(String roomNo, String optionName) {
		Map<String, String> map = new HashMap<>();
		map.put("roomNo", roomNo);
		map.put("optionName", optionName);
		return roommapper.insertRoomOption(map);
	}

	public List<RoomDTO> allOptionList() {
		return roommapper.allOptionList();
	}

	public int insertRoom(RoomDTO dto) {
		return roommapper.insertRoom(dto);
	}

	public int insertRoomImage(RoomDTO dto) {
		return roommapper.insertRoomImage(dto);
	}

	public int deleteOption(String optionName) {
		return roommapper.deleteOption(optionName);
	}


	public int setOption(String optionName, String optionPath) {
		Map<String, String> map = new HashMap<>();
		map.put("optionName", optionName);
		map.put("optionPath", optionPath);
		return roommapper.setOption(map);
	}

	

	public int deleteRoom(String roomNo) {
		return roommapper.deleteRoom(roomNo);
	}
	
}
