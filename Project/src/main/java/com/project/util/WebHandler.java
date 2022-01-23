package com.project.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.project.Member.MemberDTO;

// websocket 핸들러를 구현하기 위해서 기본적으로 textWebsockethandler를 상속 받는다,

@Component
public class WebHandler extends TextWebSocketHandler{
	
	// 웹소켓 세션을 저장할 리스트 생성
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	
	
	// websocketsession을 매개변수로 받고
	// 클라이언트가 서버로 연결 처리
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 채팅방에 접속한 사용자 세션을 리스트에 저장
		sessionList.add(session);

		Map map = session.getAttributes();
		MemberDTO se = (MemberDTO) map.get("login");
		
		// 모든 세션에 채팅 전달
		for(int i = 0; i < sessionList.size(); i++) {
			WebSocketSession s = sessionList.get(i);
			s.sendMessage(new TextMessage("notice"+se.getId() + " 님이 입장 했습니다."));
		}
		
	}
	// 클라이언트가 서버로 메세지 전송 처리
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		Map map = session.getAttributes();
		MemberDTO se = (MemberDTO) map.get("login");
		
		// 모든 세션에 채팅 전달
		for(WebSocketSession sess : sessionList) {
			if(sess.getId() == session.getId()) {
				sess.sendMessage(new TextMessage("server" + se.getId() + " : " +  message.getPayload()));
			}else {
			sess.sendMessage(new TextMessage(se.getId() + " : " +  message.getPayload()));
			}
		}
	}
	
	// 클라이언트가 연결 끊음 처리
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		// 채팅방에서 퇴장한 사용자 세션을 제거
		sessionList.remove(session);
		
		Map map = session.getAttributes();
		MemberDTO se = (MemberDTO) map.get("login");
		
		// 모든 세션에 채팅 전달
		for(int i = 0; i < sessionList.size(); i++) {
			WebSocketSession s = sessionList.get(i);
			s.sendMessage(new TextMessage(se.getId() + " 퇴장 했습니다."));
		}
		
	}

	public void sendNotice(WebSocketSession session, TextMessage message) throws Exception {
		Map map = session.getAttributes();
		MemberDTO se = (MemberDTO) map.get("login");
		String user = "server";
		
		// 모든 세션에 채팅 전달
		for(WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(user + se.getId() + " : " +  message.getPayload()));
		}
	}
	
}

