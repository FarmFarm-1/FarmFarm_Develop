package com.farmfarm.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.farmfarm.dto.MyPageUserAuctionVO;
import com.farmfarm.dto.MyPageUserCartFundingVO;
import com.farmfarm.dto.MyPageUserFundingVO;
import com.farmfarm.dto.MyPageUserCartVO;
import com.farmfarm.dto.MyPageUserFundingDetailVO;


@Repository
public class MyPageUserDAO {
	@Autowired
	SqlSession sqlSession;
	String namespace = "com.farmfarm.myPageUser.";
	
	
	public List<MyPageUserFundingVO> myPageFundingList(String user_serial_num) {

		List<MyPageUserFundingVO> userFundingList = sqlSession.selectList(namespace + "myPageFundingList",
				user_serial_num);

		return userFundingList;
	}

	public List<MyPageUserFundingDetailVO> myPageFundingListDetail(String product_serial_num) {
		return sqlSession.selectList(namespace + "myPageFundingListDetail", product_serial_num);
	}

	public List<MyPageUserAuctionVO> myPageAuctionList(String user_serial_num) {

		List<MyPageUserAuctionVO> userAuctionList = sqlSession.selectList(namespace + "myPageAuctionList",
				user_serial_num);

		return userAuctionList;
	}
	
	
	public List<MyPageUserCartVO> myPageCartFundingList(String user_serial_num) {

		List<MyPageUserCartVO> userCartFundingList = sqlSession.selectList(namespace + "myPageCartFundingList",
				user_serial_num);

		return userCartFundingList;
	}
	
	public List<MyPageUserCartVO> myPageCartAuctionList(String user_serial_num) {

		List<MyPageUserCartVO> userCartAuctionList = sqlSession.selectList(namespace + "myPageCartAuctionList",
				user_serial_num);

		return userCartAuctionList;
	}

	
	public List<Map<String, Object>> depositList(String user_serial_num){
		return sqlSession.selectList(namespace+"depositList", user_serial_num);
	}
	
	public List<Map<String, Object>> usedfarmList(String user_serial_num){
		return sqlSession.selectList(namespace+"usedfarmList", user_serial_num);
	}
	
	public List<Map<String, Object>> showSearchDate(String user_serial_num, String startDate, String endDate){
	    Map<String, Object> params = new HashMap<>();
	    params.put("user_serial_num", user_serial_num);
	    params.put("startDate", startDate);
	    params.put("endDate", endDate);
	    
	    return sqlSession.selectList(namespace + "showSearchDate", params);
	}
}





