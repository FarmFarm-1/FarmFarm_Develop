package com.farmfarm.controller;

import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;

import com.farmfarm.model.FarmersService;
import com.farmfarm.model.UsersService;

public class HttpSessionConfigurator extends ServerEndpointConfig.Configurator {
    @Override
    public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {
    	HttpSession httpSession = (HttpSession) request.getHttpSession();
    	String serial_num = (String) httpSession.getAttribute("serial_num");
    	String user_serial_num = "";
    	String farmer_serial_num = "";

    	if (serial_num != null) {
    	    if (serial_num.startsWith("us")) {
    	    	user_serial_num = serial_num;
    	    } else if (serial_num.startsWith("FA")) {
    	    	farmer_serial_num = serial_num;
    	    }
    	} else {
    	    System.out.println("serial_num is null");
    	}
        
        sec.getUserProperties().put("sender_user", user_serial_num);   
        sec.getUserProperties().put("sender_farmer", farmer_serial_num);   
    }
}