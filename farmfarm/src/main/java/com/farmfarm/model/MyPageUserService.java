package com.farmfarm.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmfarm.dto.MyPageUserAuctionVO;
import com.farmfarm.dto.MyPageUserCartFundingVO;
import com.farmfarm.dto.MyPageUserFundingVO;

@Service
public class MyPageUserService {

	@Autowired
	MyPageUserDAO dao;
	
	public List<MyPageUserFundingVO> myPageFundingList(String user_serial_num){
		return dao.myPageFundingList(user_serial_num);
	}
	
	public List<MyPageUserAuctionVO> myPageAuctionList(String user_serial_num) {
		return dao.myPageAuctionList(user_serial_num);
	}
	
	public List<MyPageUserCartFundingVO> myPageCartFundingList(String user_serial_num) {
		return dao.myPageCartFundingList(user_serial_num);
	}
}
