package com.farmfarm.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.farmfarm.model.ChattingService;

@ServerEndpoint(value = "/chatserver", configurator = HttpSessionConfigurator.class)
public class ChatServer {

	// 현재 채팅 서버에 접속한 클라이언트(WebSocket Session) 목록
	// static 붙여야함!!
	private static Map<Integer, List<Session>> roomSessions = new HashMap<>();

	@OnOpen
	public void handleOpen(Session session) throws IOException {
		String sender_user = (String) session.getUserProperties().get("sender_user");
		String sender_farmer = (String) session.getUserProperties().get("sender_farmer");
		String queryString = session.getRequestURI().getQuery();
		String[] params = queryString.split("&");
		Map<String, String> paramMap = new HashMap<>();
		for (String param : params) {
			String[] keyValue = param.split("=");
			if (keyValue.length != 2) {
				continue;
			}
			paramMap.put(keyValue[0], keyValue[1]);
		}

		String usernum = paramMap.get("user_serial_num");
		String farmernum = paramMap.get("farmer_serial_num");
		String chkroomIdStr = paramMap.get("chkroom_id");
		int chkroomid = Integer.parseInt(chkroomIdStr);

		List<Map<String, Object>> history = ApplicationContextProvider.getApplicationContext()
				.getBean(ChattingService.class).chatting_history(chkroomid);

		// JSON Array로 변환
		JSONArray historyJsonArray = new JSONArray();
		for (Map<String, Object> map : history) {
		    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		    String dateString = format.format(map.get("sentdate"));
		    map.put("sentdate", dateString);

		    // AM/PM을 오전/오후로 바꾸는 코드
		    String messagetime = (String) map.get("messagetime");
		    if (messagetime.startsWith("AM")) {
		        messagetime = "오전" + messagetime.substring(2);
		    } else if (messagetime.startsWith("PM")) {
		        messagetime = "오후" + messagetime.substring(2);
		    }
		    map.put("messagetime", messagetime);

		    JSONObject json = new JSONObject(map);
		    historyJsonArray.add(json);
		}
		session.getUserProperties().put("jsonhistory", historyJsonArray.toJSONString());
		// 사용자와 농민 번호, roomParam을 세션에 저장
		session.getUserProperties().put("usernum", usernum);
		session.getUserProperties().put("farmernum", farmernum);
		session.getUserProperties().put("chkroomid", chkroomid);
	 
		for (Object json : historyJsonArray) {
		    try {
		         session.getBasicRemote().sendText(json.toString());
		    } catch (IOException e) {
		       //e.printStackTrace();
		    }
		}
		 	
		List<Session> sessions = roomSessions.getOrDefault(chkroomid, new ArrayList<>());
		sessions.add(session);
		roomSessions.put(chkroomid, sessions);
	}

	@OnMessage
	public void handleMessage(String msg, Session session) {
		// 세션이 열려있는지 확인
		if (!session.isOpen()) {
			return; // 세션이 닫혀있다면 메서드 종료
		}

		// sender가 user인지, farmer인지 판단하기 위함.
		String sender_user = (String) session.getUserProperties().get("sender_user");
		String sender_farmer = (String) session.getUserProperties().get("sender_farmer");

		String usernum = (String) session.getUserProperties().get("usernum");
		String farmernum = (String) session.getUserProperties().get("farmernum");
		int roomId = (Integer) session.getUserProperties().get("chkroomid"); // 수정된 부분

		String sender_serial_num = "";
		sender_serial_num = sender_user.equals("") ? farmernum : usernum;
		String readyn = "n"; 

		List<Session> sessions = roomSessions.get(roomId);
		
		// 세션 리스트를 확인하여 유저와 파머 모두 접속해 있는지 확인
		if (sessions != null && sessions.size() == 2) {
		    readyn = "y"; // 유저와 파머 모두 접속해 있다면 readyn을 'y'로 설정
		}
		System.out.println("세션 사이즈는 얼마나 되는가? "+sessions.size());
		if (sessions != null) {
			for (Session s : sessions) {
				try {
					// 세션이 열려있는지 확인
					if (s.isOpen() && sender_serial_num != null && !sender_serial_num.isEmpty()) {
						Map<String, String> map = new HashMap<>();
					    // 시간 정보를 메시지에 추가
					    DateFormat dateFormat = new SimpleDateFormat("aa hh:mm"); // 오전/오후 형식으로 변경
					    Date date = new Date();
					    // 날짜 정보를 메시지에 추가
					    DateFormat dateFormatDate = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 형식
					    
						map.put("sender_serial_num", sender_serial_num);
						map.put("content", msg);
						map.put("messagetime", dateFormat.format(date));
						map.put("sentdate", dateFormatDate.format(date));  // 'sentdate'라는 키로 날짜 정보 추가
					    
					    String json = new JSONObject(map).toString();
					    s.getBasicRemote().sendText(json);
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		// sender_serial_num이 비어있지 않은 경우에만 데이터베이스에 저장
		if (sender_serial_num != null && !sender_serial_num.isEmpty()) {
			// 채팅 메시지 보내기
			Map<String, Object> messageParam = new HashMap<>();
			messageParam.put("room_id", roomId);
			messageParam.put("content", msg);
			messageParam.put("sender", sender_serial_num);
			messageParam.put("readyn", readyn);
			ApplicationContextProvider.getApplicationContext().getBean(ChattingService.class)
			.insertChatMessage(messageParam);
		}
	}

	@OnClose
	public void handleClose(Session session) {
		int roomId = (Integer) session.getUserProperties().get("chkroomid");
		List<Session> sessions = roomSessions.get(roomId);
		if (sessions != null) {
			sessions.remove(session);
			if (sessions.isEmpty()) {
				// 세션이 비어있으면 roomSessions에서 제거
				roomSessions.remove(roomId);
			}
		}
	}
}
