package com.project.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.project.Member.MemberDTO;

@Component
public class EchoHandler extends TextWebSocketHandler{
	// 로그인 중인 전체 유저
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	// 로그인 중인 개별 유저
	Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	
	// 클라이언트가 서버로 연결 시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			sessions.add(session);
			
			String senderId = getMemberId(session);
			users.put(senderId, session);
		}
	
	

	// 클라이언트가 data 전송 시
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//		String senderid = getMemberId(session);
		String msg = message.getPayload();
		System.out.println(msg);
		if(msg != null) {
			String[] strs = msg.split(",");
			log(strs.toString());
			if(strs != null ) {			
				String target = strs[0];
				String seq = strs[1];
				String content = strs[2];
				WebSocketSession targetSession = users.get(content);
				
				if(targetSession != null) {
					TextMessage tmpMsg = new TextMessage(target + "님이 " + 
							 seq + " 게시글에 댓글을 남겼습니다.");
							targetSession.sendMessage(tmpMsg);
				}			
			}
		}
	}
	
	// 연결 해제될 때
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		users.remove(session.getId());
		sessions.remove(session);
		}
	
	// 에러 발생시
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생 :" + exception.getMessage());
	}
	
	
	
	// 로그 메세지
	private void log(String string) {
		System.out.println(new Date() + " : " + string);
		
	}

	//웹 소켓에 id 가져오기
	// 접속한 유저의 http 세션을 조회하여 id 를 얻는 함수
	private String getMemberId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		MemberDTO loginUser = (MemberDTO)httpSession.get("login");
		
		if(loginUser == null) {
			return session.getId();
	}else {
		return loginUser.getId();
	}
	
	
}
	}
