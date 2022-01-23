package com.project.board;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.project.mapper.Mapper;

@Service
public class BoardService {
	@Autowired
	private Mapper bm;
	private String title,n;

	public ModelAndView getBoardList(int page) {
		ModelAndView mav = new ModelAndView("board/board");
		BoardPaging paging = new BoardPaging();

		int boardCount = bm.selectCount(paging); // 현재 게시판의 게시글 총 개수
		paging.setPage(boardCount, page); // 전체 개수와 현재 페이지를 전달하면
		int first = paging.getFirst(); // 페이징 처리된 첫 글번호와 // 1
		int last = paging.getLast(); // 페이징 처리된 마지막 글번호를 받아온다 // 10

		List<BoardDTO> list = bm.getBoard(paging);
		mav.addObject("list", list);

		mav.addObject("nowPage", page); // 현재 보고있는 페이지 번호
		mav.addObject("begin", paging.getBegin()); // 전체 페이지의 범위 시작
		mav.addObject("end", paging.getEnd()); // 전체 페이지의 범위 끝

		mav.addObject("prev", paging.hasPrev());
		mav.addObject("next", paging.hasNext());

		mav.addObject("number",0);
		
		return mav;
	}

	public ModelAndView getSearchBoard(String search_title, String search, int page) {
		ModelAndView mav = new ModelAndView("board/board");
		BoardPaging paging = new BoardPaging();
		
		int boardCount = bm.searchCount(search_title,search);

		
		paging.setPage(boardCount, page);
		int first = paging.getFirst();
		int last = paging.getLast();
		
		List<BoardDTO> list = bm.searchList(first, last, search_title, search);
		

		mav.addObject("list", list);
		mav.addObject("search_title", search_title);
		mav.addObject("search", search);
		mav.addObject("nowPage", page); // 현재 보고있는 페이지 번호
		mav.addObject("begin", paging.getBegin()); // 전체 페이지의 범위 시작
		mav.addObject("end", paging.getEnd()); // 전체 페이지의 범위 끝

		mav.addObject("prev", paging.hasPrev());
		mav.addObject("next", paging.hasNext());

		mav.addObject("number",1);
		
		return mav;
	}

	public BoardDTO readList(int num) {
		return bm.readList(num);
	}

	public int insertboard(BoardDTO dto) {
		return bm.insertboard(dto);
	}

	public int countup(int num) {
		return bm.countup(num);
	}

	public int delpost(int num) {
		return bm.delpost(num);
	}

	public int reviseboard(BoardDTO dto) {
		return bm.reviseboard(dto);
	}

	public List<BoardDTO> searchlist(String string, String string2) {
		return null;
	}

}
