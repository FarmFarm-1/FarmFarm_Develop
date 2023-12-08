package com.farmfarm.model;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SignUpDAO {

	@Autowired
	SqlSession sqlSession;
	String namespace = "com.farmfarm.emailCheck.";
	
	public int emailCheck(HttpServletResponse response, String email) {
		int user = sqlSession.selectOne(namespace + "emailCheckUser", email);
		int farmer = sqlSession.selectOne(namespace + "emailCheckFarmer", email);
		
		return user+farmer;
	}
}
