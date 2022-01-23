<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

		<div id="main">
	<h1 id="sign">로그인</h1>
	<form method="post">
	<p class="sign_p">아이디</p>
	<input type="text" placeholder="ID" autofocus required
		autocomplete="off" name="id" class="sign_input">
	<p class="sign_p">비밀번호</p>
	<input type="password" placeholder="PW" required  class="sign_input" name="pw">
    <div id="msg">${msg }</div>
    <div class="submit">
        <input type="submit" value="로그인" class="input_su">
    </div>
</form>
</div>

<%@ include file="footer.jsp"%>