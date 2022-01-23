package com.project.Controller;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.board.BoardDTO;
import com.project.board.BoardService;
import com.project.board.reply.ReplyDTO;
import com.project.board.reply.ReplyService;
import com.project.util.EchoHandler;

@Controller
@RequestMapping("board")
public class BoardController {
	
	@Autowired private BoardService bs;
	@Autowired private ReplyService rs;
	
	@GetMapping("")
	public ModelAndView boardList() {
			return boardList(1);				
	}

	@GetMapping("{page}")
	public ModelAndView boardList(@PathVariable int page) {
			return bs.getBoardList(page);			
	}
	
	@PostMapping("/boardsearch")
	public ModelAndView bosearch(@RequestParam HashMap<String,String> formData) {
		return bosearch(formData,1);
	};

	@GetMapping("/boardsearch/{page}")
	public ModelAndView bosearch(@RequestParam HashMap<String,String> formData,@PathVariable int page) {
		return bs.getSearchBoard(formData.get("search_title"),formData.get("search"),page);
	};
	
	@GetMapping("read/{num}")
	public ModelAndView readList(@PathVariable int num) {
		ModelAndView mav = new ModelAndView("board/read");
		int row = bs.countup(num);
		BoardDTO list = bs.readList(num);
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("write")
	public void write() {}
	
	@PostMapping("write")
	public ModelAndView write(BoardDTO dto) {
		ModelAndView mav = new ModelAndView();
		int row = bs.insertboard(dto);
		mav.addObject("msg", row != 0 ? "1" : "0");
		return mav;
	}
	
	@GetMapping("delpost/{num}")
	public ModelAndView delpost(@PathVariable int num) {
		int row = bs.delpost(num);
		return row == 1 ? boardList(1) : null;
	}
	
	@GetMapping("revise/{page}")
	public ModelAndView revise(@PathVariable int page) {
		ModelAndView mav = new ModelAndView("board/revise");
		BoardDTO list = bs.readList(page);
		mav.addObject("list", list);
		return mav;
	}
	
	@PostMapping("revise/{page}")
	public ModelAndView revise(BoardDTO dto) {
		ModelAndView mav = new ModelAndView("board/revise");
		int row = bs.reviseboard(dto);
		mav.addObject("msg", row != 0 ? "1" : "0");
		mav.addObject("idx",dto.getIdx());
		return mav;
	
	}
	
	@PostMapping("reply/{page}")
	public String insertreply(@PathVariable int page, ReplyDTO reply) {
		int row = rs.insertreply(page,reply);
		return "redirect:/board/read/" + page;
	}
	
	@GetMapping("delreply/{num}")
	public String delreply(@PathVariable int num) {
		int boardidx = rs.getBoardIdx(num);
		int row = rs.delreply(num);
		
		return "redirect:/board/read/" + boardidx;
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
