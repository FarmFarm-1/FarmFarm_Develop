package com.farmfarm.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChattingService {

	@Autowired
	ChattingDAO chattingdao;

	public int insertChatRoom(Map<String, Object> map) {
		return chattingdao.insertChatRoom(map);
	}

	public int insertChatMessage(Map<String, Object> map) {
		return chattingdao.insertChatMessage(map);
	}
	
	public int checkroom(Map<String, Object> map) {
		return chattingdao.checkroom(map);
	}

	public List<Map<String, Object>> checkroomUser(String user_serial_num) {
		return chattingdao.checkroomUser(user_serial_num);
	}
	
	public List<Map<String, Object>> checkroomFarmer(String farmer_serial_num) {
		return chattingdao.checkroomFarmer(farmer_serial_num);
	}
	
	public List<Map<String, Object>> chatting_history(int room_id) {
		return chattingdao.chatting_history(room_id);
	}
	
	public int updateRead(Map<String, Object> map) {
		return chattingdao.updateRead(map);
	}
	
	public int exitChatroom(int room_id) {
		return chattingdao.exitChatroom(room_id);
	}
}
