package com.farmfarm.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.farmfarm.dto.MyPageUserAuctionVO;
import com.farmfarm.dto.MyPageUserCartFundingVO;
import com.farmfarm.dto.MyPageUserFundingVO;

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

	public List<MyPageUserAuctionVO> myPageAuctionList(String user_serial_num) {

		List<MyPageUserAuctionVO> userAuctionList = sqlSession.selectList(namespace + "myPageAuctionList",
				user_serial_num);

		return userAuctionList;
	}
	
	public List<MyPageUserCartFundingVO> myPageCartFundingList(String user_serial_num) {

		List<MyPageUserCartFundingVO> userCartFundingList = sqlSession.selectList(namespace + "myPageCartFundingList",
				user_serial_num);

		return userCartFundingList;

	}
}
