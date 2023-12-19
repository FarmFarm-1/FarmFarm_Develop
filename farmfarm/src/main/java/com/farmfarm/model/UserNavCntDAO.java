package com.farmfarm.model;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserNavCntDAO {
	
	@Autowired
	SqlSession sqlSession;
	String namespace = "com.farmfarm.UserNavCnt.";
	
	public HashMap<String,Object> getUserInfo(String user_serial_num) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int fundingNum = sqlSession.selectOne(namespace+"userFundingNum",user_serial_num);
		int auctionNum = sqlSession.selectOne(namespace+"userAuctionNum",user_serial_num);
		int cartNum = sqlSession.selectOne(namespace+"userCartNum",user_serial_num);
		int userPoint = sqlSession.selectOne(namespace+"userPoint",user_serial_num);
		String userName = sqlSession.selectOne(namespace+"userName",user_serial_num);
		
		map.put("fundingNum", fundingNum);
		map.put("auctionNum", auctionNum);
		map.put("cartNum", cartNum);
		map.put("userPoint", userPoint);
		map.put("userName", userName);
		
		return map;
	}
	

}
