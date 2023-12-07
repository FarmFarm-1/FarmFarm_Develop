package com.farmfarm.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.farmfarm.dto.Farm_and_productVO;

@Repository
public class ProductDAO {
	
	@Autowired
	SqlSession sqlSession;
	String namespace = "com.farmfarm.Farm_and_productVO.";
	
	public List<Farm_and_productVO> fundingListSelectAll() {
		return sqlSession.selectList(namespace+"fundingListSelectAll");
	}

	public List<Farm_and_productVO> auctionListSelectAll() {
		return sqlSession.selectList(namespace+"auctionListSelectAll");
	}

	public Farm_and_productVO auctionInfo(String product_serial_num) {
		return sqlSession.selectOne(namespace+"auctionInfo",product_serial_num);
	}
	
}
