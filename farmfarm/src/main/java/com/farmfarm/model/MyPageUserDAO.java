package com.farmfarm.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.farmfarm.dto.MyPageUserFundingVO;

@Repository
public class MyPageUserDAO {
	@Autowired
	SqlSession sqlSession;
	String namespace = "com.farmfarm.myPageUser.";
	
	public List<MyPageUserFundingVO> myPageFundingList(String user_serial_num) {
		
		List<MyPageUserFundingVO> userFundingList = sqlSession.selectList(namespace + "myPageFundingList", user_serial_num);
		
		return userFundingList;
	}
	
	public int myFundingRate() {
		int result = sqlSession.selectOne(namespace + "myFundingRate");
		
		return result;
	}
}
