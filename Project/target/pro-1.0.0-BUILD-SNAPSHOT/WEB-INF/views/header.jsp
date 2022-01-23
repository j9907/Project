<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ProM</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
   <style type="text/css">
* {
	font-family: 나눔고딕;
}

body {
	-ms-overflow-style: none;
}

::-webkit-scrollbar {
	display: none;
}

/* 전체영역에서 여백을 없애줌 */
* {
	margin: 0;
	padding: 0;
}
/* ul li태그에 리스트 스타일을 없앰 */
ul li {
	list-style: none;
}
/* a태그에 텍스트 밑줄을 없애고 색상을 #333 */
a, .temp {
	text-decoration: none;
	color: #ffd700;
	font-size: 15pt;
}
/* 글자크기를 16px 맑은 고딕 굵게하고 width넓이 700, 높이 50만큼 배경색은 #ccc, 글자색은 검정색, 라인높이50px
            menu박스 가운데정렬, 글자가운데 정렬 */
#menu {
	font: bold 16px "malgun gothic";
	display: flex;
	align-items: center;
	justify-content: space-between;
	width: 100%;
	height: 100px;
	background: midnightblue;
	line-height: 50px;
	margin: 0 auto;
	text-align: center;
}

/* menu태그 자식의 ul의 자식 li를 왼쪽정렬과 넓이 140설정 */
#menu>ul>li {
	float: left;
	width: 140px;
	position: relative;
}

#menu>ul>li>ul {
	width: 130px;
	display: none;
	position: absolute;
	font-size: 13pt;
	background: midnightblue;
}

#menu>ul>li:hover>ul {
	display: block;
}

p.header_left {
	color: #ffd700;
	font-size: 30pt;
	font-weight: bold;
	margin-left: 30px;
}

div#main {
	margin-top: 20px;
	text-align: center;
	display: flex;
	flex-flow: column;
	align-items: center;
	justify-content: center;
	height: 700px;
}

h1#sign {
	text-align: center;
	color: midnightblue;
	margin-top: 30px;
}

.sign_input {
	padding: 12px;
	margin: 3px;
	width: 280px;
	border: 1px solid midnightblue;
	border-radius: 30px;
}

input:focus {
	outline: none;
}

.sign_p {
	padding: 5px;
	text-align: left;
	width: 70px;
	font-weight: bold;
	color: midnightblue;
	margin-top: 15px;
}

.sign_m {
	width: 88px;
	padding: 10px;
	border-radius: 30px;
	border: 1px solid midnightblue;
}

.sign_se {
	padding: 10px;
	border-radius: 30px;
	border: 1px solid midnightblue;
	width: 98%;
}

.submit {
	margin: 30px;
}

.input_su {
	background-color: midnightblue;
	color: #ffd700;
	border: 0;
	padding: 10px;
	border-radius: 30px;
	width: 200px;
	font-weight: bold;
	font-size: 13pt;
}

#sign_bo {
	font-size: 10pt;
	font-weight: boler;
}

#chat {
	margin-bottom: 30px;
	font-weight: bold;
	height: 500px;
	border: 1px solid midnightblue;
	border-radius: 10px;
	margin: 10px;
	margin-left: 20%;
	margin-right: 20%;
}

#main-container {
	width: 600px;
	height: 680px;
	border: 1px solid black;
	margin: 10px;
	display: inline-block;
}

#chat-container {
	margin: 10px;
}

.chat {
	font-size: 13pt;
	color: #ffd700;
	margin: 5px;
	min-height: 20px;
	padding: 5px;
	min-width: 50px;
	height: auto;
	word-break: break-all;
	width: auto;
	display: inline-block;
	border-radius: 10px;
	background-color: midnightblue;
}

.notice {
	color: #607080;
	font-weight: bold;
	border: none;
	text-align: center;
	background-color: #9bbbd4;
	display: block;
}

.my-chat {
	text-align: right;
	background: #b0018e;
	border-radius: 10px;
}

#bottom-container {
	margin: 10px;
}

.chat-info {
	color: #556677;
	font-size: 13pt;
	text-align: center;
	padding: 5px;
	padding-top: 0px;
}

#sendchat {
	padding: 5px;
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	height: 300px;
}

#message {
	width: 50%;
	padding: 10px;
	border-radius: 10px;
	border: 1px solid midnightblue;
	margin: 10px;
}

#btn {
	margin: 5px;
	background-color: midnightblue;
	color: #ffd700;
	border: 0;
	padding: 10px;
	border-radius: 10px;
	font-weight: bold;
	cursor: pointer;
}

.my-chat-box {
	text-align: right;
}

.btn {
	background-color: midnightblue;
	color: #ffd700;
	border-radius: 10px;
	padding: 10px;
	font-weight: bold;
	border: 0;
	cursor: pointer;
	margin: 20px;
}

#readlist {
	display: flex;
	margin-top:30px;
	align-items: center;
	justify-content: center;
}

.main {
	border: 1px solid midnightblue;
	border-radius: 10px;
	height: auto;
	min-height:600px;
	width: 70%;
}

#top {
	border-bottom: 1px solid midnightblue;
	padding: 10px;
}

.top {
	display: flex;
	width: 80%;
	padding: 10px 10px 10px 0;
	align-items: center;
}

.under {
	display: flex;
	width: 80%;
	padding: 10px 10px 10px 0;
	align-items: center;
}

.side {
	margin: auto 20px auto 20px;
	height: auto;
	min-height: 600px;
}

#buttom {
	margin-top: 30px;
	height: auto;
	
}

.idx {
	font-size: 5px;
	padding-right: 10px;
	color: #dadada;
}

.title {
	font-size: 20pt;
	font-weight: bold;
	color: midnightblue;
}

.writer, .viewcount, .datetime {
	padding-right: 10px;
	font-size: 8pt;
	color: midnightblue;
}

.writeinput {
	border: 0;
}

.writeinputitle{
	color:midnightblue;
	font-size: 20pt;
	font-weight: bold;
	border:0;
}


textarea {
	resize: none;
	font-size: 15pt;
	width: 100%;
	height:auto;
	min-height:600px;
	line-height: 30px;
}

textarea:focus {
	outline: 0;
}
div#msg{
	font-size:10pt;
	color:red;
	font-weight: bold;
	padding-top:10px;
}
pre{
	line-height: 30px;
}
</style>
</head>
<body>
    
        <div id="menu">
            <div><p class="header_left"><a href="${cpath }" style="font-size:30pt;">Project</a></p></div>
            <ul>
               	<c:if test="${empty login }">
               		<li><a href="${cpath }/signup">Signup</a></li>
               	</c:if>
               		<c:if test="${not empty login }">
               		<li><a href="">Chat</a>
                    <ul>
                        <li><a href="#">귓속말</a></li>
                        <li><a href="${cpath }/chat">그룹채팅</a></li>
                        <li><a href="#">익명채팅</a></li>
                    </ul>
                </li>
               	 <li><a href="${cpath }/board">Board</a></li>
               		<li class="temp">${login.id } 님</li>
               	</c:if>
               	 <li><a href="${cpath}/${empty login ? 'login' : 'logout' }">${empty login ? 'Login' : 'Logout' }</a></li>
               
            </ul>
        </div>
