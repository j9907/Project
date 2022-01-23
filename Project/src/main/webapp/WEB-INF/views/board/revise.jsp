<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div id="readlist">
        <div class="main">
        <form method="post">
            <div class="side">
            <div id="top">
                <div class="top">
                    <p class="title">
                    <input type="text" placeholder="제목" autofocus autocomplete="off" name="title" class="writeinputitle" value=${list.title }>
                    </p>
                </div>
                <div class="under">
                    <p class="writer"><input type="text" value="${list.writer }" readonly="readonly" name="writer" class="writeinput"></p>
               		<input name="idx" value="${list.idx }" type="hidden">
                </div>
            </div>
            <div id="buttom">
                <p class="content"><textarea name="content" rows="10" class="writeinput" placeholder="글을 작성하세요!">${list.content }</textarea></p>
            </div>
        <input type="submit" value="수정하기" class="btn" style="float:right" >
        </div>
        </form>
        </div>
    </div>

 <script>
  	var jsVar = '${msg}';
  	
  		if(jsVar === '1'){
  			alert('수정이 완료되었습니다');
  			location.href='${cpath}/board/read/${idx}';
  		}
  		if(jsVar == '0'){
  			alert('수정이 실패되었습니다');
  		}
  	
  	
  </script>
<%@ include file="../footer.jsp"%>