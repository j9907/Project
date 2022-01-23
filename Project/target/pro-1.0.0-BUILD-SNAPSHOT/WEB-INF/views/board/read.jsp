<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<style>
#readlist{
            display: flex;
            margin-top:30px;
            align-items:center;
            justify-content: center;
            flex-flow: column;
        }
        .main{
            border:1px solid midnightblue;
            border-radius: 10px;
            height:auto;
            min-height:600px;
            width:80%;
        }
        #top{
            border-bottom: 1px solid midnightblue;
            padding:10px;
            
        }
        .top{
            display: flex;
            width:80%;
            padding:10px 10px 10px 0;
            align-items: center;
        }
        .under{
            display: flex;
            width:80%;
            padding:10px 10px 10px 0;
            align-items: center;
        }
        .side{
            margin:auto 20px auto 20px;
            height: auto;
            min-height:600px;
        }
        #buttom{
            margin-top:30px;
			height:70%;
        }
        .idx{
            font-size:5px;
            padding-right:10px;
            color:#dadada;
        }
        .title{
            font-size:20pt;
            font-weight: bold;
            color:midnightblue;
        }
        .writer ,.viewcount ,.datetime{
            padding-right: 10px;
            font-size:8pt;
            color:midnightblue;삭제하다
        }
       
.h3{
	text-align: center;
	margin-bottom:30px;
	font-size:20pt;
	color:midnightblue;
}
div#btngroup{
	display: flex;
	justify-content: space-between;
}

</style>
<div id="readlist">
	<h3 class="h3">게시글</h3>
        <div class="main">
            <div class="side">
            <div id="top">
                <div class="top">
                    <p class="title">${list.title }</p>
                </div>
                <div class="under">
                    <p class="writer">${list.writer }</p>
                    <p class="datetime">${list.datetime }</p>
                    <p class="viewcount">조회 ${list.viewCount }</p>
                </div>
            </div>
            <div id="buttom">
                <pre>${list.content }</pre>
            </div>
        </div>
        <div id="btngroup">
        <button class="btn" onclick="location.href='${cpath}/board'">돌아가기</button>
      <c:if test="${login.id == list.writer }">
        <div id="right">
        <button class="btn" onclick="location.href='${cpath}/board/revise/${list.idx }'">수정</button>
        <button class="btn" onclick="del()">삭제</button>
        </div>
      </c:if>
        </div>
        </div>
    </div>
<script>
	function del(){
		var del = confirm('정말 삭제하시겠습니까?');
		if(del){
			location.href='${cpath}/board/delpost/${list.idx }';
		}
	}
</script>
<%@ include file="../footer.jsp"%>