package com.farmfarm.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.farmfarm.dto.Farm_and_productVO;

@Repository
public class FundingDAO {
	
	@Autowired
	SqlSession sqlSession;
	String namespace = "com.farmfarm.product.";
	
	public List<Farm_and_productVO> fundingListSelectAll() {
		return sqlSession.selectList(namespace+"fundingListSelectAll");
	}

	public Map<String, Object> fundingInfo(String product_serial_num) {
		Map<String, Object> result = sqlSession.selectOne(namespace+"fundingInfo",product_serial_num);
		System.out.println(result);
		 
		return result;
	}
	
}
