package com.farmfarm.model;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FarmerNavCntDAO {

	@Autowired
	SqlSession sqlSession;
	String namespace = "com.farmfarm.FarmerNavCnt.";
	
	public HashMap<String, Integer> getCnt(String farmer) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int cntFund = sqlSession.selectOne(namespace + "cntTotalFund", farmer);
		int cntCart = sqlSession.selectOne(namespace + "cntTotalCart", farmer);
		int cntAuction = sqlSession.selectOne(namespace + "cntTotalAuc", farmer);
		
		map.put("cntFund", cntFund);
		map.put("cntCart", cntCart);
		map.put("cntAuction", cntAuction);
		
		return map;
	}

}
