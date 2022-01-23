package com.project.board.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.mapper.Mapper;

@Service
public class ReplyService {

@Autowired private Mapper mp;
	
	public List<ReplyDTO> replyList(int reply_bno) {
		return mp.replyList(reply_bno);
	}

	public int insertreply(int page, ReplyDTO reply) {
		return mp.insertreply(page,reply);
	}

	public int delreply(int num) {
		return mp.delreply(num);
	}

	public int getBoardIdx(int num) {
		return mp.getBoardIdx(num);
	}

}
