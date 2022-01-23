<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
@charset "utf-8";
h3{
	text-align: center;
	padding-top:30px;
	font-size:20pt;
	color:midnightblue;
}
#boardList{
	border-collapse: collapse; 
	margin: 30px auto 30px auto;
	width: 80%;
	min-width: 80%;
	text-align:center;
}
#boardList tr {
	border-bottom: 1px solid #dadada;
	height: 45px;
}
#boardList tr:hover {
	cursor: default;
}
#boardList thead > tr {
	background-color:midnightblue;	
	color: #ffd700;
	font-weight: bold;
}
#boardList tbody td {
	text-align: center;
}
#boardList tbody > tr:hover {
	background-color: #dadada;
}
#boardList tbody .boardt {
	width: 5%;
}
#boardList tbody .boardt {
	width: 58%;
	padding-left: 20px;

}
#boardList tbody .boardt > a {
	text-decoration: none;
	color: inherit;
	font-weight: bold;
	display: block;
}
#boardList tbody .boardt > a:hover {
	cursor: pointer;
}
#boardList tbody .boardw {
	width: 10%;
}
#boardList tbody .boardv {
	width: 10%;
}
#boardList tbody .boardd {
	width: 10%;
}

#boardList tbody .current {
	background-color: #eaeaea;
}
.board-number{
	display: inline-block;
	float: left;
	padding-left:20px;
}
.board-title{
	display: inline-block;
	padding-right:20px;
	font-weight: bold;
	font-size:15pt;
}
#a:hover{
	border-bottom:1px solid midnightblue;
}
.paging{
	text-align: center;
}
.button{
	display:flex;
	margin-left:10%;
	margin-right:10%;
	align-items: center;
	justify-content: space-between;
}

#a{
	color:black;
	font-size:11pt;
}

.search{
	padding:5px;
	border-radius: 10px;
}
.in_search{
	padding:5px;
	border-radius: 10px;
	border:1px solid midnightblue;
}
.in_sub{
	padding:6px;
	background-color: midnightblue;
	border-radius: 10px;
	color:white;
	border:0;
	cursor:pointer;
}

</style>
<div id="table">
<h3>게시판</h3>
<table id="boardList">
<thead>

	<tr>
		<td class="boardt" colspan="2">제목</td>
		<td class="boardw">작성자</td>
		<td class="boardd">작성일</td>
		<td class="boardv">조회수</td>
	</tr>
</thead>
<tbody>
	<c:forEach var="list" items="${list }">
		<tr>
			<td colspan="2" class="boardt">
				<div class="board-number">${list.idx }</div>
				<div class="board-title"><a href="${cpath }/board/read/${list.idx}" id="a">${list.title }</a></div>
			</td>
			<td class="boardw">${list.writer }</td>
			<td class="boardd">${list.datetime }</td>
			<td class="boardv">${list.viewCount }</td>
		</tr>
	</c:forEach>
</tbody>	
</table>
</div>
<div class="paging">
		<c:if test="${prev }">
			<a href="${number == 0} ? ${cpath }/board/${begin - 1}/ : ${cpath}/board/boardsearch/${begin-1}"
			   style="display: inline; color:midnightblue; font-size:12pt;">◀</a>
		</c:if>
		<c:forEach var="page" begin="${begin }" end="${end }">
			<c:if test="${nowPage == page }">
				<b style="border-bottom:1px solid midnightblue">[${page }]</b>
			</c:if>
			<c:if test="${not (nowPage == page) }">
				<a id="searchLisk" style="display: inline; color:midnightblue; font-size:12pt;" href="${cpath }/board/${number == 0 ? '' : 'boardsearch'}/${page}">
					[${page }] </a>
			</c:if>
		</c:forEach>
		
		<c:if test="${next }">
			<a href="${cpath }/board/${number == 1 ? 'boardsearch' : ''}/${end + 1}"
			   style="display: inline; color:midnightblue; font-size:12pt;">▶</a>
		</c:if>
	</div>
<div class="button">
	<div>
		<a href="${cpath }/board/write/"><button class="btn">새 글 작성</button></a>
	</div>
	<form method="post" action="${cpath }/board/boardsearch">
	<div class="btnright">
		<select class="search" name="search_title">
			<option value="title">제목</option>
			<option value="writer">작성자</option>
		</select>
		<input class="in_search" type="text" name="search" placeholder="검색할 항목을 입력해주세요" autocomplete="off">
		<input class="in_sub" type="submit" value="검색">
	</div>
	</form>
</div>
<%@ include file="../footer.jsp"%>
