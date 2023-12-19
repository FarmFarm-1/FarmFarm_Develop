package com.farmfarm.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.farmfarm.dto.User_cartVO;

@Repository
public class FundingDAO {
	
	@Autowired
	SqlSession sqlSession;
	String namespace = "com.farmfarm.funding_list.";
	
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
	
	//funding
	public List<Map<String, Object>> fundingListSelectAll(String type) {
		if (type == null) {			
			return sqlSession.selectList(namespace+"fundingListSelectAll");
		}if (type.equals("all")) {
			return sqlSession.selectList(namespace+"fundingListSelectByTypeAll");
		}else {
			return sqlSession.selectList(namespace+"fundingListSelectByType", type);
		}
	}
	
	public List<Map<String, Object>> fundingListSelectHot() {
		return sqlSession.selectList(namespace+"fundingListSelectHot");
	}
	
	public List<Map<String, Object>> fundingListSelectSupport(String type) {
		if (type == null || type.equals("all")) {	
			return sqlSession.selectList(namespace+"fundingListSelectSupport");
		} else {
			return sqlSession.selectList(namespace+"fundingListSelectByTypeSupport", type);			
		}
	}
	
	public List<Map<String, Object>> fundingListSelectClosing(String type) {
		if (type == null || type.equals("all")) {				
			return sqlSession.selectList(namespace+"fundingListSelectClosing");
		} else {
			return sqlSession.selectList(namespace+"fundingListSelectByTypeClosing", type);
		}
	}
	
	public List<Map<String, Object>> fundingListSelectAmount(String type) {
		if (type == null || type.equals("all")) {	
			return sqlSession.selectList(namespace+"fundingListSelectAmount");
		} else {
			return sqlSession.selectList(namespace+"fundingListSelectByTypeAmount", type);
		}
	}
	
	public List<Map<String, Object>> fundingListSelectRecent(String type) {
		if (type == null || type.equals("all")) {	
			return sqlSession.selectList(namespace+"fundingListSelectRecent");
		} else {
			return sqlSession.selectList(namespace+"fundingListSelectByTypeRecent", type);
		}
	}
	
	public List<Map<String, Object>> fundingListSelectByType(String type) {
		if (type.equals("all")) {
			return sqlSession.selectList(namespace+"fundingListSelectByTypeAll");
		}else {
			return sqlSession.selectList(namespace+"fundingListSelectByType", type);
		}
	}
	
	public List<Map<String, Object>> fundingSearch(String input) {
		return sqlSession.selectList(namespace+"fundingSearch", input);
	}

	
	
}
