package com.farmfarm.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.farmfarm.dto.User_cartVO;

@Repository
public class MyPageDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	String namespace_myPage = "com.farmfarm.myPage.";
	
	public int addMyCart(User_cartVO user_cartVO) {
		return sqlSession.insert(namespace_myPage+"addMyCart", user_cartVO);
	}
	
	public int deletecart(User_cartVO user_cartVO) {
		return sqlSession.delete(namespace_myPage+"deletecart", user_cartVO);
	}

	public int bookmarkCnt(String product_serial_num) {
		return sqlSession.selectOne(namespace_myPage+"bookmarkCnt",product_serial_num);
	}

	public int pointCheck(String user_serial_num) {
		return sqlSession.selectOne(namespace_myPage+"pointCheck",user_serial_num);
	}
	
	public int myBookmarkShow(HashMap<String, Object> data) {
		return sqlSession.selectOne(namespace_myPage+"myBookmarkShow",data);
	}
	//jw
	public List<String> myBookmarkShowList(String user_serial_num) {
		return sqlSession.selectList(namespace_myPage+"myBookmarkShowList",user_serial_num);
	}

	public List<String> myBookmarkShowByUser(String user_serial_num) {
		return sqlSession.selectList(namespace_myPage+"myBookmarkShowByUser",user_serial_num);
	}
}
