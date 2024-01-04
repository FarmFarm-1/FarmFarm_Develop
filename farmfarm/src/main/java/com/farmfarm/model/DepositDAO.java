package com.farmfarm.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DepositDAO {

	@Autowired
	SqlSession sqlSession;

	String namespace = "com.farmfarm.jaeho.";
	
	public List<Map<String, Object>> depositList_farmer(String farmer_serial_num) {
		return sqlSession.selectList(namespace + "depositList_farmer", farmer_serial_num);
	}
}
