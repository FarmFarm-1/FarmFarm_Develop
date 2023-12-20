package com.farmfarm.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.farmfarm.dto.MyPageUserAuctionVO;
import com.farmfarm.dto.MyPageUserCartFundingVO;
import com.farmfarm.dto.MyPageUserFundingDetailVO;
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

	public List<MyPageUserFundingDetailVO> myPageFundingListDetail(String product_serial_num) {
		return sqlSession.selectList(namespace + "myPageFundingListDetail", product_serial_num);
	}

	public List<MyPageUserAuctionVO> myPageAuctionList(String user_serial_num) {

		List<MyPageUserAuctionVO> userAuctionList = sqlSession.selectList(namespace + "myPageAuctionList",
				user_serial_num);

		return userAuctionList;
	}

	public List<MyPageUserCartFundingVO> myPageCartAllList(String user_serial_num) {

		List<MyPageUserCartFundingVO> userCartAllList = sqlSession.selectList(namespace + "myPageCartAllList",
				user_serial_num);

		return userCartAllList;
	}

}
