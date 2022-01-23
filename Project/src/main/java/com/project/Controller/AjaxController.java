package com.project.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.project.Member.MemberDTO;
import com.project.Member.MemberService;
import com.project.board.BoardDTO;
import com.project.board.reply.ReplyDTO;
import com.project.board.reply.ReplyService;

@RestController
public class AjaxController {
	
	@Autowired private MemberService ms;
	@Autowired private ReplyService rs;
	
	@RequestMapping(value = "userid", method = RequestMethod.POST,produces = "applcation/text;charset=utf8")
	public String SelectUserID(String id) {
		MemberDTO userid = ms.selectOne(id);
		String msg = userid == null ? "멋진 아이디네요!" : "일치하는 아이디가 존재합니다.";
		return msg;
	}
	
	@PostMapping("/board/replylist/{reply_bno}")
	public List<ReplyDTO> replylist(@PathVariable int reply_bno){
		List<ReplyDTO> replylist = rs.replyList(reply_bno);
		return replylist;
	}
}
