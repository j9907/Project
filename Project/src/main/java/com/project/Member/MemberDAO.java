package com.project.Member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.mapper.Mapper;

@Repository
public class MemberDAO {

	@Autowired private Mapper mp;
	
	public int insertuser(MemberDTO dto) {
		return mp.insertuser(dto);
	}
	
	public MemberDTO selectOne(String name) {
		return mp.selectOne(name);
	}

	public int updatepro(MemberDTO dto) {
		return mp.updatepro(dto);
	}
	
}
