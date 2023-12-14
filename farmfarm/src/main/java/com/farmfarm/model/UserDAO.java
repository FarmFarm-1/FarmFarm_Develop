package com.farmfarm.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.farmfarm.dto.UsersVO;

@Repository
public class UserDAO {
	
	@Autowired
	SqlSession sqlSession;
	String namespace = "com.farmfarm.users.";
	
	public UsersVO loginUser(UsersVO vo) {
		return sqlSession.selectOne(namespace+"loginUser",vo);
	}
	
	public int userInsert(UsersVO vo) {
		int result =0;
		result = sqlSession.insert(namespace+"userInsert",vo);
		return result;
	}

	public List<UsersVO> getAllUsers() {
		return sqlSession.selectList(namespace+"getAllUsers");
	}
	
	public int userpoint(Map<String,Object> userpoint) {
		return sqlSession.insert(namespace +"userpoint");
	}
	
}
