package com.farmfarm.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.farmfarm.dto.User_cartVO;

@Repository
public class AuctionDAO {
	
	@Autowired
	SqlSession sqlSession;
	String namespace = "com.farmfarm.auctionVO.";
	
	//cart
	public int addMyCart(User_cartVO user_cartVO) {
		return sqlSession.insert(namespace+"addMyCart", user_cartVO);
	}
	
	public int deletecart(User_cartVO user_cartVO) {
		return sqlSession.delete(namespace+"deletecart", user_cartVO);
	}

	public int bookmarkCnt(String product_serial_num) {
		return sqlSession.selectOne(namespace+"bookmarkCnt",product_serial_num);
	}

	public List<String> myBookmarkShowList(String user_serial_num) {
		return sqlSession.selectList(namespace+"myBookmarkShowList",user_serial_num);
	}

	public int pointCheck(String user_serial_num) {
		return sqlSession.selectOne(namespace+"pointCheck",user_serial_num);
	}
	
	//auction
	public List<Map<String, Object>> auctionListSelectAll(String type) {
		if (type == null) {			
			return sqlSession.selectList(namespace+"auctionListSelectAll");
		}if (type.equals("all")) {
			return sqlSession.selectList(namespace+"auctionListSelectByTypeAll");
		}else {
			return sqlSession.selectList(namespace+"auctionListSelectByType", type);
		}
	}
	
	public List<Map<String, Object>> auctionListSelectHot() {
		return sqlSession.selectList(namespace+"auctionListSelectHot");
	}
	
	public List<Map<String, Object>> auctionListSelectSupport(String type) {
		if (type == null || type.equals("all")) {			
			return sqlSession.selectList(namespace+"auctionListSelectSupport");
		} else {
			return sqlSession.selectList(namespace+"auctionListSelectByTypeSupport", type);			
		}
	}
	
	public List<Map<String, Object>> auctionListSelectClosing(String type) {
		if (type == null || type.equals("all")) {				
			return sqlSession.selectList(namespace+"auctionListSelectClosing");
		} else {
			return sqlSession.selectList(namespace+"auctionListSelectByTypeClosing", type);
		}
	}
	
	public List<Map<String, Object>> auctionListSelectAmount(String type) {
		if (type == null || type.equals("all")) {	
			return sqlSession.selectList(namespace+"auctionListSelectAmount");
		} else {
			return sqlSession.selectList(namespace+"auctionListSelectByTypeAmount", type);
		}
	}
	
	public List<Map<String, Object>> auctionListSelectRecent(String type) {
		if (type == null || type.equals("all")) {	
			return sqlSession.selectList(namespace+"auctionListSelectRecent");
		} else {
			return sqlSession.selectList(namespace+"auctionListSelectByType", type);
		}
	}
	
	public List<Map<String, Object>> auctionListSelectByType(String type) {
		if (type.equals("all")) {
			return sqlSession.selectList(namespace+"auctionListSelectByTypeAll");
		}else {
			return sqlSession.selectList(namespace+"auctionListSelectByType", type);
		}
	}
	
	public List<Map<String, Object>> auctionSearch(String input) {
		return sqlSession.selectList(namespace+"auctionSearch", input);
	}

	
}
