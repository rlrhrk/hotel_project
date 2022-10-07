package com.hotel.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.hotel.dto.MemberDTO;

@Mapper
public interface MemberMapper {
	int insertMember(MemberDTO member);
	MemberDTO matchMember(@Param("email") String email, @Param("password") String password);
	// 아이디 찾기
	List<MemberDTO> selectMemberId(HashMap<Object, Object> map);
	// 비밀번호 찾기
	List<MemberDTO> selectMemberPass(HashMap<Object, Object> map);
	// 비밀번호 변경
	int updatePasswd(HashMap<Object, Object> map);
	
	List<MemberDTO> selectAllMember();
	int deleteMember(String email);
	int updateMember(MemberDTO dto);
	List<MemberDTO> searchMember(Map<String, Object> map);
	MemberDTO selectMember(String email);
	int selectGenderCount(String gender);
	int selectMonthCount(Map<String, String> map);
}
