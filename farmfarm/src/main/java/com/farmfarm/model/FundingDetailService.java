package com.farmfarm.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmfarm.dto.Farm_and_productVO;
import com.farmfarm.dto.User_cartVO;

@Service
public class FundingDetailService {

	@Autowired
	FundingDetailDAO dao;

	public List<Farm_and_productVO> fundingListSelectAll() {
		return dao.fundingListSelectAll();
	}

	public Map<String, Object> fundingInfo(String product_serial_num) {
		return dao.fundingInfo(product_serial_num);
	}

	public int bookmarkCnt(String product_serial_num) {
		return dao.bookmarkCnt(product_serial_num);
	}

	public int myBookmarkShow(String product_serial_num, String user_serial_num) {
		return dao.myBookmarkShow(product_serial_num, user_serial_num);
	}

	public int addMyCart(User_cartVO user_cartVO) {
		return dao.addMyCart(user_cartVO);
	}

	public int deletecart(User_cartVO user_cartVO) {
		return dao.deletecart(user_cartVO);
	}

	public int pointCheck(String user_serial_num) {
		return dao.pointCheck(user_serial_num);
	}

	public int buyFunding(Map<String, Object> map) {
		return dao.buyFunding(map);
	}
	
	public int updateFunding(Map<String, Object> map){
		return dao.updateFunding(map);
	}
	
	public int selectcnt(Map<String, Object> map) {
		return dao.selectcnt(map);
	}
	
	public Map<String, Object> sumfunding(String product_serial_num) {
		return dao.sumfunding(product_serial_num);
	}
}
