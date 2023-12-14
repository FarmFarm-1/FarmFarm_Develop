package com.farmfarm.model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.farmfarm.dto.FarmersVO;

@Repository
public class FarmersDAO {

	@Autowired
	SqlSession sqlSession;
	String namespace = "com.farmfarm.FarmersVO.";

	public String loginCheck(FarmersVO f) {
		String result = sqlSession.selectOne(namespace + "loginCheck", f);
		return result;
	}

	public String readMember(String farmer_email) {
		// 이메일 있는지 조회
		System.out.println("dao : " + farmer_email);
		String result = "";
		result = sqlSession.selectOne(namespace + "readMember", farmer_email);
		return result;
	}

	public int updatePw(FarmersVO vo) throws Exception {
		return sqlSession.update(namespace + "updatePw", vo);
	}

}
