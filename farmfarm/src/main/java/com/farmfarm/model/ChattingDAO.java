package com.farmfarm.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.farmfarm.dto.Crops_quoteVO;
import com.farmfarm.dto.User_cartVO;

@Repository
public class ChattingDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "com.farmfarm.chatting.";

	
	public int insertChatRoom(Map<String, Object> map) {
		return sqlSession.insert(namespace+"insertChatRoom",map);

	}
	public int insertChatMessage(Map<String, Object> map) {
		return sqlSession.insert(namespace+"insertChatMessage",map);
	}
	public int checkroom(Map<String, Object> map) {
		Integer result = sqlSession.selectOne(namespace+"checkroom",map);
		return (result == null) ? -1:result;
	}
	
	public List<Map<String, Object>> checkroomUser(String user_serial_num) {
		return sqlSession.selectList(namespace+"checkroomUser",user_serial_num);
	}
	
	public List<Map<String, Object>> checkroomFarmer(String farmer_serial_num) {
		return sqlSession.selectList(namespace+"checkroomFarmer",farmer_serial_num);
	}
	
	public List<Map<String, Object>> chatting_history(int room_id) {
		return sqlSession.selectList(namespace+"chatting_history", room_id);

	}
	
	public int updateRead(Map<String, Object> map) {
		return sqlSession.update(namespace+"updateRead",map);
	}
	
	public int exitChatroom(int room_id) {
		return sqlSession.delete(namespace + "exitChatroom",room_id);
	}
}
