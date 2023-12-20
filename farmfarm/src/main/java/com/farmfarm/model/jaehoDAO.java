package com.farmfarm.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class jaehoDAO {

	@Autowired
	SqlSession sqlSession;
	
	String namespace = "com.farmfarm.jaeho.";
	
	//서포터
	public List<Map<String, Object>> depositList(String user_serial_num){
		return sqlSession.selectList(namespace+"depositList", user_serial_num);
	}
	
	public List<Map<String, Object>> farmList(String user_serial_num){
		return sqlSession.selectList(namespace+"farmList", user_serial_num);
	}
	
	public List<Map<String, Object>> showSearchDate(String user_serial_num, String startDate, String endDate){
	    Map<String, Object> params = new HashMap<>();
	    params.put("user_serial_num", user_serial_num);
	    params.put("startDate", startDate);
	    params.put("endDate", endDate);
	    
	    return sqlSession.selectList(namespace + "showSearchDate", params);
	}
	
	//파머
	public List<Map<String, Object>> depositList_farmer(String farmer_serial_num){
		return sqlSession.selectList(namespace+"depositList_farmer", farmer_serial_num);
	}
}
