package com.farmfarm.model.auth;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.farmfarm.dto.FarmersVO;
import com.farmfarm.dto.UsersVO;

@Repository
public class SignUpDAO {

	@Autowired
	SqlSession sqlSession;
	String namespace = "com.farmfarm.emailCheck.";
	String namespace2 = "com.farmfarm.signUp.";
	
	public int emailCheck(HttpServletResponse response, String email) {
		int user = sqlSession.selectOne(namespace + "emailCheckUser", email);
		int farmer = sqlSession.selectOne(namespace + "emailCheckFarmer", email);
		
		return user+farmer;
	}
	
	public int userSignUp(UsersVO users) {
		int result = 0; 
		try {
			result = sqlSession.insert(namespace2 + "userSignUp", users);
		}catch(Exception e){
			
		}
		System.out.println(result);
		return result;
	}

	public int farmerSignUp(FarmersVO farmers) {
		int result = 0;
		try {
			result = sqlSession.insert(namespace2 + "farmerSignUp", farmers);
		}catch(Exception e){
			
		}
		System.out.println(result);
		return result;
	}
}
