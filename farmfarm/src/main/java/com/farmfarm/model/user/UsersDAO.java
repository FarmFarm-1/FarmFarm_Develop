package com.farmfarm.model.user;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.farmfarm.dto.UsersVO;

@Repository
public class UsersDAO {

	@Autowired
	SqlSession sqlSession;
	
	String namespace = "com.farmfarm.UsersVO.";
	
	
	public String loginCheck(UsersVO u) {
		
		String result = "";
		result = sqlSession.selectOne(namespace+"loginCheck", u);
		return result;
	}
	
	public String readMember(String user_email){
		// 이메일 있는지 조회 
		System.out.println("dao : " + user_email);
		String result = "";		
		result = sqlSession.selectOne(namespace+"readMember", user_email);
		return result;
	}
	
	public int updatePw(UsersVO vo) throws Exception {
		return sqlSession.update(namespace+"updatePw", vo);
	}
	
	//재호
	public String findName(String user_serial_num){
		return sqlSession.selectOne(namespace +"findName" ,user_serial_num);
	}
	
	public String pwCheck(String user_serial_num){
		return sqlSession.selectOne(namespace + "pwCheck", user_serial_num);
	}
	
    public int changePw(UsersVO vo) {
        return sqlSession.update(namespace + "changePw", vo);
    }
    //재호
}
