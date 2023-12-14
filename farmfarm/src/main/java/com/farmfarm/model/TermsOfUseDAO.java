package com.farmfarm.model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.farmfarm.dto.TermsOfUseVO;

@Repository
public class TermsOfUseDAO {

	@Autowired
	SqlSession sqlSession;
	String namespace = "com.farmfarm.term.";
	
	public TermsOfUseVO getTermContent(String term_content) {
		return sqlSession.selectOne(namespace + "getTermContent", term_content);
	}
}
 