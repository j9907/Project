<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<style>
#readlist {
	display: flex;
	margin-top: 30px;
	align-items: center;
	justify-content: center;
	flex-flow: column;
}

.main {
	border: 1px solid midnightblue;
	border-radius: 10px;
	height: auto;
	min-height: 600px;
	width: 80%;
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
	height: 70%;
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
	삭제하다
}

.h3 {
	text-align: center;
	margin-bottom: 30px;
	font-size: 20pt;
	color: midnightblue;
}

div#btngroup {
	display: flex;
	justify-content: space-between;
}

div#replybox {
	margin: auto 20px 20px 20px;
	border-top: 1px solid midnightblue;
	height: auto;
}

.reply {
	margin-top: 30px;
	display: flex;
	flex-flow: column;
	border: 1px solid midnightblue;
	padding: 10px;
	border-radius: 10px;
}

.replyinput {
	border: 0;
	margin: 10px;
	resize: none;
}

.replybtn {
	border: 0;
	background-color: white;
	text-align: right;
	margin-right: 20px;
	color: midnightblue;
	font-weight: bold;
}

p.replywriter {
	font-weight: bold;
	padding: 5px 0 5px 0;
}

p.replydate {
	font-size: 8pt;
	padding: 5px 0 5px 0;
	color: midnightblue;
}

.reply_b {
	border-bottom: 1px solid midnightblue;
	min-height: 100px;
	display: flex;
	flex-flow: column;
	justify-content: center;
}

#replybtn {
	display: flex;
	justify-content: space-between;
}

.replybtn:hover {
	cursor: pointer;
}
#n_reply{
	margin : 10px 0 0 10px;
}
</style>
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

<script>
	$(document).ready(function() {
		// 	   connectWs();		
		webSocket.init({
			url : '<c:url value="/echo" />'
		});
		getreplylist();
	});
</script>
<script>
	var webSocket = {
		init : function(param) {
			this._url = param.url;
			this._initSocket();
		},
		sendChat : function() {
			var user = '${login.id}';
			var writer = '${list.writer}';
			if (user != writer) {
				var arr = [ '${login.id}', '${list.title}', '${list.writer}' ]
				this._sendMessage(arr);
			}

		},
		receiveMessage : function(str) {
			toastr.options.escapeHtml = true;
			toastr.options.closeButton = true;
			toastr.options.newestOnTop = false;
			toastr.options.progressBar = true;
			toastr.info(data, '알림', {
				timeOut : 5000
			});
		},
		closeMessage : function(str) {
			$('#chat-container').append('<div>' + '연결 끊김 : ' + str + '</div>');
		},
		disconnect : function() {
			this._socket.close();
		},
		_initSocket : function() {
			this._socket = new SockJS(this._url);
			this._socket.onmessage = function(evt) {
				webSocket.receiveMessage(evt.data);
			};
			this._socket.onclose = function(evt) {
				webSocket.closeMessage(evt.data);
			}
		},
		_sendMessage : function(str) {
			this._socket.send(str);
		}
	};
</script>
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
					<button class="btn"
						onclick="location.href='${cpath}/board/revise/${list.idx }'">수정</button>
					<button class="btn" onclick="del()">삭제</button>
				</div>
			</c:if>
		</div>
		<div id="replybox">
			<div class="replylist">
				<%-- 					<c:if test="${not empty replylist }"> --%>
				<%-- 						<c:forEach var="reply" items="${replylist}"> --%>
				<!-- 						<div class="reply_b"> -->
				<%-- 							<p class="replywriter">${reply.writer}</p> --%>
				<%-- 							<p class="replycontent">${reply.content}</p> --%>
				<!-- 							<div id="replybtn"> -->
				<%-- 							<p class="replydate">${reply.datetime}</p> --%>
				<%-- 							<c:if test="${reply.writer == login.id}"> --%>
				<%-- 							<button class="replybtn" onclick="replydel(${reply.idx})">삭제</button> --%>
				<%-- 							</c:if> --%>
				<!-- 							</div> -->
				<!-- 						</div> -->
				<%-- 						</c:forEach> --%>
				<%-- 					</c:if> --%>

			</div>
			<form method="post" action="${cpath }/board/reply/${list.idx}">
				<div class="reply">
					<%-- 						<input type="hidden" name="boardidx" value="${list.idx }"> --%>
					<input name="writer" value="${login.id }" readonly="readonly"
						class="replyinput">
					<textarea name="content" placeholder="댓글을 남겨보세요" class="replyinput"></textarea>
					<input type="submit" value="등록" class="replybtn"
						onclick="webSocket.sendChat()">
				</div>
			</form>
		</div>

	</div>
</div>
<script>
	function del() {
		var del = confirm('정말 삭제하시겠습니까?');
		if (del) {
			location.href = '${cpath}/board/delpost/${list.idx }';
		}
	}
	function replydel(idx) {
		var del = confirm('댓글을 삭제합니다');
		if (del) {
			location.href = '${cpath}/board/delreply/' + idx;
		}
	}
	function getreplylist() {
		var replyurl = "${cpath}/board/replylist/";
		var reply_bno = "${list.idx}";
		var reply_writer = "${login.id}"
		

		$.ajax({
			url : replyurl + reply_bno,
			type : 'POST',
			dataType : 'json',
			success : function(result) {
				var comments = "";
				if (result.length < 1) {
					comments += '<div class="reply_b"> ' + '등록된 댓글이 없습니다' + '</div>';
				} else {
					$(result).each(function() {
						comments += '<div class="reply_b">'
						comments += '<p class="replywriter">' + this.writer;
						comments += '<p class="replycontent">' + this.content;
						comments += '<div id="replybtn">';
						comments += '<p class="replydate">' + getFormatDate(this.datetime) + '</p>';
						if(this.writer == reply_writer){
							comments += '<button class="replybtn" onclick="replydel('+this.idx+')">삭제</button>'
						}
						comments += '</div></div>'
					});
				};
				$(".replylist").html(comments);
			}
		});
	};

	function getFormatDate(date) {
		var time = new Date(date);
		var year = time.getFullYear();
		var month = (1 + time.getMonth());
		month = month >= 10 ? month : '0' + month;
		var day = time.getDate();
		day = day >= 10 ? day : '0' + day;
		return year + '-' + month + '-' + day;
	}
</script>

<%@ include file="../footer.jsp"%>