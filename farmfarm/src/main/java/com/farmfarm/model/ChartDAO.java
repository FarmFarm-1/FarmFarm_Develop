package com.farmfarm.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.farmfarm.dto.Crops_quoteVO;

@Repository
public class ChartDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "com.farmfarm.Crops_quoteVO.";

	public List<Crops_quoteVO> cropsInfoByKind(String crops_kind) {
		return sqlSession.selectList(namespace+"cropsInfoByKind",crops_kind);
	}

	public int cropsPriceAvg(String crops_kind) {
		return sqlSession.selectOne(namespace+"cropsPriceAvg",crops_kind);
	}
	
	
}
