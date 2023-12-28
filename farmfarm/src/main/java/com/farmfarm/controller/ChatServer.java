package com.farmfarm.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value = "/chatserver", configurator = HttpSessionConfigurator.class)
public class ChatServer {

    // 현재 채팅 서버에 접속한 클라이언트(WebSocket Session) 목록
    // static 붙여야함!!
    private static Map<String, Session> map = new HashMap<>();

    @OnOpen
    public void handleOpen(Session session) throws IOException {
        String usernum = (String) session.getUserProperties().get("usernum");
        String farmernum = (String) session.getUserProperties().get("farmernum");
        System.out.println("handleOpen");
        System.out.println("usernum = "+usernum);
        System.out.println("farmernum = "+farmernum);

        map.put(session.getId(), session); // 접속자 관리(****)
    }

    @OnMessage
    public void handleMessage(String msg, Session session) {

        String usernum = (String) session.getUserProperties().get("usernum");
        String farmernum = (String) session.getUserProperties().get("farmernum");

        System.out.println("OnMessage");
        System.out.println("usernum = " + usernum);
        System.out.println("farmernum = " + farmernum);
        
        for (Map.Entry<String, Session> entry : map.entrySet()) {
            try {
                // 같은 사용자의 다른 세션에도 메시지를 전송
               // if (!entry.getKey().equals(session.getId()) || usernum.equals(session.getUserProperties().get("usernum"))) {
            	if (farmernum != null) {
            	    entry.getValue().getBasicRemote().sendText(farmernum + ": " + msg);
            	} else if (usernum != null) {
            	    entry.getValue().getBasicRemote().sendText(usernum + ": " + msg);
            	} else {
            	    // 아무것도 안함.
            	}
                //}
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    @OnClose
    public void handleClose(Session session) {
        map.remove(session.getId()); // 사용자 세션 제거
    }
}
