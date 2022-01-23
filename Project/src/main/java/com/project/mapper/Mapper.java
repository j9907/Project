package com.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.project.Member.MemberDTO;
import com.project.board.BoardDTO;
import com.project.board.BoardPaging;
import com.project.board.reply.ReplyDTO;

public interface Mapper {


	// member 추가
	@Insert("insert into member values (#{id},#{pw},#{name},#{gender},#{birth},#{profile})")
	public int insertuser(MemberDTO dto);
	
	// login
	@Select("select * from member where id = #{id}")
	public MemberDTO selectOne(String name);
	
	// board select
	@Select("select * from (select rownum as st, A.* from (select * from board order by idx desc) A where rownum <= #{last}) where st >= #{first}")
	public List<BoardDTO> getBoard(BoardPaging paging);

	
	
	// board count
	@Select("select count(*) from board ")
	public int selectCount(BoardPaging paging);

	// board/read
	@Select("select * from board where idx = #{param1}")
	public BoardDTO readList(int num);
	
	// board/write
	@Insert("insert into board(title,writer,content) values (#{title},#{writer},#{content})")
	public int insertboard(BoardDTO dto);

	// viewcount update
	@Update("update board set viewcount = viewcount + 1 where idx = #{param1}")
	public int countup(int num);

	//board/del
	@Delete("delete from board where idx = #{param1}")
	public int delpost(int num);

	// board/revise
	@Update("update board set title = #{title} , content = #{content} where idx = #{idx}")
	public int reviseboard(BoardDTO dto);

	// reply 
	@Select("select * from reply where boardidx = #{param1} order by idx asc")
	public List<ReplyDTO> replyList(int idx);
	
	// 댓글 추가
	@Insert("insert into reply(boardidx,writer,content) values (#{param1},#{param2.writer},#{param2.content})")
	public int insertreply(int page, ReplyDTO reply);

	// 댓글 삭제
	@Delete("delete from reply where idx = #{param1}")
	public int delreply(int num);

	// 댓글 삭제 하기 전 이동할 게시글 번호
	@Select("select boardidx from reply where idx = #{param1}")
	public int getBoardIdx(int num);

	//프로필 업로드
	@Update("update member set profile = #{profile} , name = #{name} where id = #{id}")
	public int updatepro(MemberDTO dto);


	@Select("select * from (select rownum as st, A.* from (SELECT * FROM board WHERE ${param3} LIKE '%${param4}%'  order by idx desc) A where rownum <= #{param2}) where st >= #{param1}")
	public List<BoardDTO> searchList(int first, int last,String search_title, String search);

	@Select("SELECT count(*) FROM BOARD WHERE ${param1} LIKE '%${param2}%' ")
	public int searchCount(String search_title, String search);
}
