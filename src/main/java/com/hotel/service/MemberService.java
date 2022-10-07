package com.hotel.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.dto.MemberDTO;
import com.hotel.mapper.MemberMapper;
import com.hotel.model.JoinRequest;
import com.hotel.model.LoginRequest;

@Service
public class MemberService {
	@Autowired
	private MemberMapper memberMapper;
	
//-------------------------------------------------김유나-----------------------------------------------------------
	
	public void insertMember(JoinRequest join) {
		MemberDTO memberDTO = new MemberDTO(join.getEmail(), join.getName(), join.getPassword(), join.getGender(),
											join.getBirth(), join.getTel(), join.getAddress());
		memberMapper.insertMember(memberDTO);
	}
	
	public MemberDTO matchMember(LoginRequest loginRequest) {
		return memberMapper.matchMember(loginRequest.getEmail(), loginRequest.getPassword());
	}

//-------------------------------------------------김유나-----------------------------------------------------------

//-------------------------------------------------이동희-----------------------------------------------------------
	
	public List<MemberDTO> selectMemberId(String memberName, String tel) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("memberName", memberName);
		map.put("tel", tel);
		System.out.println("service" + map);
		return memberMapper.selectMemberId(map);
	}

	public List<MemberDTO> selectMemberPass(String email, String memberName, String tel) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("email", email);
		map.put("memberName", memberName);
		map.put("tel", tel);
		return memberMapper.selectMemberPass(map);
	}

	public int updatePasswd(String email, String password) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("email", email);
		map.put("password", password);
		return memberMapper.updatePasswd(map);
	}
	
//-------------------------------------------------이동희-----------------------------------------------------------
	
//-------------------------------------------------박은수-----------------------------------------------------------
	
	public List<MemberDTO> selectAllMember() {
		return memberMapper.selectAllMember();
	}

	public int deleteMember(String email) {
		return memberMapper.deleteMember(email);
	}

	public int updateMember(MemberDTO dto) {
		return memberMapper.updateMember(dto);
	}

	public List<MemberDTO> searchMember(String kind, String search) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("kind", kind);
		map.put("search", search);
		return memberMapper.searchMember(map);
	}

	public MemberDTO selectMember(String email) {
		return memberMapper.selectMember(email);
	}
	
	public int selectGenderCount(String gender) {
		return memberMapper.selectGenderCount(gender);
	}

	public int selectMonthCount(Map<String, String> map) {
		return memberMapper.selectMonthCount(map);
	}

//-------------------------------------------------박은수-----------------------------------------------------------
}
