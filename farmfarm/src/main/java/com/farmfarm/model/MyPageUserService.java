package com.farmfarm.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmfarm.dto.MyPageUserFundingVO;

@Service
public class MyPageUserService {

	@Autowired
	MyPageUserDAO dao;
	
	public List<MyPageUserFundingVO> myPageFundingList(String user_serial_num){
		return dao.myPageFundingList(user_serial_num);
	}
	
	public int myFundingRate() {
		return dao.myFundingRate();
		
	}
}
