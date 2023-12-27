package com.farmfarm.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.farmfarm.dto.Farm_and_productVO;
import com.farmfarm.dto.User_cartVO;

@Repository
public class FundingDetailDAO {

	@Autowired
	SqlSession sqlSession;
	String namespace = "com.farmfarm.FundingDetail.";

	public List<Farm_and_productVO> fundingListSelectAll() {
		return sqlSession.selectList(namespace + "fundingListSelectAll");
	}

	public Map<String, Object> fundingInfo(String product_serial_num) {
		Map<String, Object> result = sqlSession.selectOne(namespace + "fundingInfo", product_serial_num);
		return result;
	}
	
	public int fundingInfocnt(String product_serial_num) {
		return sqlSession.selectOne(namespace + "fundingInfocnt", product_serial_num);
	}

	public int bookmarkCnt(String product_serial_num) {
		return sqlSession.selectOne(namespace + "bookmarkCnt", product_serial_num);
	}

	public int myBookmarkShow(String product_serial_num, String user_serial_num) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("user_serial_num", user_serial_num);
		map.put("product_serial_num", product_serial_num);
		return sqlSession.selectOne(namespace + "myBookmarkShow", map);
	}

	public int addMyCart(User_cartVO user_cartVO) {
		return sqlSession.insert(namespace + "addMyCart", user_cartVO);
	}

	public int deletecart(User_cartVO user_cartVO) {
		return sqlSession.delete(namespace + "deletecart", user_cartVO);
	}

	public int pointCheck(String user_serial_num) {
		return sqlSession.selectOne(namespace + "pointCheck", user_serial_num);
	}

	public int buyFunding(Map<String, Object> map) {
		return sqlSession.insert(namespace+"buyFunding",map);
	}
	
	public int updateFunding(Map<String, Object> map){
		return sqlSession.update(namespace+"updateFunding",map);
	}
	
	public int selectcnt(Map<String, Object> map) {	
		return sqlSession.selectOne(namespace+"selectcnt",map);
	}
	
	public Map<String, Object> sumfunding(String product_serial_num) {
	    return sqlSession.selectOne(namespace + "sumfunding", product_serial_num);
	}

	public int checkFundingPossibility(Map<String, Object> map) {
		return sqlSession.selectOne(namespace + "checkFundingPossibility", map);
	}
}
