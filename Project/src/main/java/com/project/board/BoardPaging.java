package com.project.board;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component			// 이건 컨트롤러도 아니고, 서비스도 아니고, 리포지터리도 아니지만 어쨌든 스프링 빈으로 써달라
@Scope("prototype")		// 여러 사용자가 들어왔는데 같은 페이징 객체를 쓰면 안되니까, 싱글톤을 사용하지 않는다 !!
public class BoardPaging {
	
	private int page;
	private final int perPage = 10;		// 한 페이지 당 10개의 글을 출력하기
	private final int perSection = 10;	// 한 화면에 최대 10개의 페이지 번호만 출력하기
	
	private int first;		// 첫번째 글번호
	private int last;		// 마지막 글번호
	private int begin;		// 하단 페이징 영역 첫번째
	private int end;		// 하단 페이징 영역 마지막
	private boolean prev;
	private boolean next;
	
	private String search_title;
	private String search;

	public String getSearch_title() {
		return search_title;
	}
	
	@Override
	public String toString() {
		return "Paging [page = " + page + ", perPage="+ perPage + ",keywor=" + search + "]";
	}

	public void setSearch_title(String search_title) {
		this.search_title = search_title;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public void setPage(int boardCount, int page) {
		this.page = page;
		int pageCount = boardCount / perPage;
		pageCount += boardCount % perPage == 0 ? 0 : 1;
		this.first = (page - 1) * perPage + 1;
		this.last = first + perPage - 1;
		
		int section = (page - 1) / 10;
		begin = 10 * section + 1;
		end = begin + perSection - 1 > pageCount ? pageCount : begin + perSection - 1;
		
		setPrev(section != 0);
		setNext(boardCount > perPage * end);
	}

	public int getFirst() {
		return first;
	}

	public void setFirst(int first) {
		this.first = first;
	}

	public int getLast() {
		return last;
	}

	public void setLast(int last) {
		this.last = last;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getPage() {
		return page;
	}

	public boolean hasPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean hasNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}
}