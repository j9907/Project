<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
	
	<script type="text/javascript">
		var webSocket = {
			init: function(param) {
				this._url = param.url;
				this._initSocket();
			},
			sendChat: function() {
				this._sendMessage($('#message').val());
				$('#message').val('');
			},
			receiveMessage: function(str) {
				if(str.substring(0,6) == 'server'){
					var $chat = $("<div class='my-chat-box'><div class='chat my-chat'>" + str.substring(6) + "</div></div>");
					$("#chat-container").append($chat);
				}else{
					if(str.substring(0,6) == 'notice'){
						var $chat = $("<div class='chat-box'><div class='chat-info'>" + str.substring(6) + "</div></div>");
						$("#chat-container").append($chat);
					}else{
						var $chat = $("<div class='chat-box'><div class='chat'>" + str + "</div></div>");
						$("#chat-container").append($chat);
					}
				}		
			},
			closeMessage: function(str) {
				$('#chat-container').append('<div>' + '연결 끊김 : ' + str + '</div>');
			},
			disconnect: function() {
				this._socket.close();
			},
			_initSocket: function() {
				this._socket = new SockJS(this._url);
				this._socket.onmessage = function(evt) {
					webSocket.receiveMessage(evt.data);
				};
				this._socket.onclose = function(evt) {
					webSocket.closeMessage(evt.data);
				}
			},
			_sendMessage: function(str) {
				this._socket.send(str);
			}
		};
	</script>	
	<script type="text/javascript">
		$(document).ready(function() {
			webSocket.init({ url: '<c:url value="/chat" />' });			
		});
	</script>
</head>
<body>
<div id="wid100">
<h3 class="chath3">채팅방</h3>
	<div id="chat">
		<div id="chat-container"></div>
	</div>
	<div id="sendchat">
		<input type="text" id="message" size="110" onkeypress="if(event.keyCode==13){webSocket.sendChat();}" />
		<input type="button" id="btn" value="채팅 전송" onclick="webSocket.sendChat()" />
		<input type="button" id="btn" value="나가기" onclick="location.href='${cpath}'">
	</div>
	</div>
<%@ include file="footer.jsp"%>