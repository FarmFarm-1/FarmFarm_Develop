package com.farmfarm.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageFarmerDAO {

	@Autowired
	SqlSession sqlSession;
	
	String namespace = "com.farmfarm.myPageFarmer.";
	
	public List<Map<String, Object>> selectProjectList(String farmer_serial_num) {
		return sqlSession.selectList(namespace+"selectProjectList",farmer_serial_num);
	}
}
