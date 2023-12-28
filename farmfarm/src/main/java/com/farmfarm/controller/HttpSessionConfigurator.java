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
    	String usernum = "";
    	String farmernum = "";

    	if (serial_num != null) {
    	    if (serial_num.startsWith("us")) {
    	         usernum = serial_num;
    	    } else if (serial_num.startsWith("FA")) {
    	         farmernum = serial_num;
    	    }
    	} else {
    	    System.out.println("serial_num is null");
    	}
        
        sec.getUserProperties().put("usernum", usernum);   
        sec.getUserProperties().put("farmernum", farmernum);   
    }
}