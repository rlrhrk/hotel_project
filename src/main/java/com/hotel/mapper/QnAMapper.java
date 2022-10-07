package com.hotel.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.hotel.dto.MemberDTO;
import com.hotel.dto.QnADTO;

@Mapper
public interface QnAMapper {

	List<QnADTO> selectQna(Map<String, Object> map);
	
	int qnaCount(String email);

	int updateQnaResponse(Map<String, Object> map);

	int deleteQnaResponse(String qnano);
	


}
