package com.farmfarm.model.farmer;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FarmerNavCntDAO {

	@Autowired
	SqlSession sqlSession;
	String namespace = "com.farmfarm.FarmerNavCnt.";
	
	public HashMap<String, Object> getCnt(String farmer) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		Integer cntFund = sqlSession.selectOne(namespace + "cntTotalFund", farmer);
		int cntCart = sqlSession.selectOne(namespace + "cntTotalCart", farmer);
		int cntAuction = sqlSession.selectOne(namespace + "cntTotalAuc", farmer);
		String name = sqlSession.selectOne(namespace + "FarmerName", farmer);
		
		map.put("cntFund", cntFund);
		map.put("cntCart", cntCart);
		map.put("cntAuction", cntAuction);
		map.put("name", name);
		
		return map;
	}

}
