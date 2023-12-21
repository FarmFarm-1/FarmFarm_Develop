package com.farmfarm.model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.farmfarm.dto.FarmersVO;
import com.farmfarm.dto.UsersVO;

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
		// �씠硫붿씪 �엳�뒗吏� 議고쉶
		System.out.println("dao : " + farmer_email);
		String result = "";
		result = sqlSession.selectOne(namespace + "readMember", farmer_email);
		return result;
	}

	public int updatePw(FarmersVO vo) throws Exception {
		return sqlSession.update(namespace + "updatePw", vo);
	}

	// 재호
	public String pwCheck(String farmer_serial_num) {
		return sqlSession.selectOne(namespace + "pwCheck", farmer_serial_num);
	}
	
    public int changePw(FarmersVO vo) {
        return sqlSession.update(namespace + "changePw", vo);
    }
	// 재호
}
