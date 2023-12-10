package com.farmfarm.model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.farmfarm.dto.Crops_quoteVO;

@Repository
public class ChartDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "com.farmfarm.Crops_quoteVO.";

	public Crops_quoteVO cropsInfoByKind(String crops_kind) {
		return sqlSession.selectOne(namespace+"cropsInfoByKind",crops_kind);
	}
	
	
}
