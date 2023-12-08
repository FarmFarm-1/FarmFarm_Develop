package com.farmfarm.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.farmfarm.dto.Auction_historyVO;
import com.farmfarm.dto.Farm_and_productVO;
import com.farmfarm.dto.User_cartVO;

@Repository
public class AuctionDAO {
	
	@Autowired
	SqlSession sqlSession;
	String namespace = "com.farmfarm.Farm_and_productVO.";
	
	public List<Farm_and_productVO> fundingListSelectAll() {
		return sqlSession.selectList(namespace+"fundingListSelectAll");
	}

	public List<Farm_and_productVO> auctionListSelectAll() {
		return sqlSession.selectList(namespace+"auctionListSelectAll");
	}

	public Map<String, Object> auctionInfo(String product_serial_num) {
		return sqlSession.selectOne(namespace+"auctionInfo",product_serial_num);
	}
	
	public List<Map<String, Object>> auctionHistorySelectAll(String product_serial_num) {
		return sqlSession.selectList(namespace+"auctionHistorySelectAll",product_serial_num);
	}
	
	public Map<String, Object> maxAndCntAuctionInfo(String product_serial_num) {
		return sqlSession.selectOne(namespace+"maxAndCntAuctionInfo", product_serial_num);
	}

	public int addMyCart(User_cartVO user_cartVO) {
		return sqlSession.insert(namespace+"addMyCart", user_cartVO);
	}
	
	public int deletecart(User_cartVO user_cartVO) {
		return sqlSession.delete(namespace+"deletecart", user_cartVO);
	}

	public int bookmarkCnt(String product_serial_num) {
		return sqlSession.selectOne(namespace+"bookmarkCnt",product_serial_num);
	}

	public int myBookmarkShow(String product_serial_num, String user_serial_num) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("user_serial_num", user_serial_num);
		map.put("product_serial_num", product_serial_num);
		return sqlSession.selectOne(namespace+"myBookmarkShow",map);
	}

	public int pointCheck(String user_serial_num) {
		return sqlSession.selectOne(namespace+"pointCheck",user_serial_num);
	}
}
