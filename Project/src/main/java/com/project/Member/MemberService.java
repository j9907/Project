package com.project.Member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

	@Autowired private MemberDAO dao;
	
	public int insertuser(MemberDTO dto) {
		return dao.insertuser(dto);
	}
	
	public MemberDTO selectOne(String name) {
		return dao.selectOne(name);
	}

	public int updatepro(MemberDTO dto,HttpSession session) {
		int row = dao.updatepro(dto);
		if(row == 1) {
			MemberDTO mem = dao.selectOne(dto.getId());
			session.setAttribute("login", mem);
			return row;
		}
		return row;
	}
	
}
