package com.farmfarm.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmfarm.dto.Auction_historyVO;
import com.farmfarm.dto.Farm_and_productVO;
import com.farmfarm.dto.User_cartVO;

@Service
public class AuctionService {
	
	@Autowired
	AuctionDAO dao;

	public List<Farm_and_productVO> auctionListSelectAll() {
		return dao.auctionListSelectAll();
	}

	public Map<String, Object> auctionInfo(String product_serial_num) {
		return dao.auctionInfo(product_serial_num);
	}
	
	public List<Map<String, Object>> auctionHistorySelectAll(String product_serial_num) {
		return dao.auctionHistorySelectAll(product_serial_num);
	}
	
	public Map<String, Object> maxAndCntAuctionInfo(String product_serial_num) {
		return dao.maxAndCntAuctionInfo(product_serial_num);
	}

	public int addMyCart(User_cartVO user_cartVO) {
		return dao.addMyCart(user_cartVO);
	}
	
	public int deletecart(User_cartVO user_cartVO) {
		return dao.deletecart(user_cartVO);
	}

	public int bookmarkCnt(String product_serial_num) {
		return dao.bookmarkCnt(product_serial_num);
	}

	public int myBookmarkShow(String product_serial_num, String user_serial_num) {
		return dao.myBookmarkShow(product_serial_num, user_serial_num);
		
	}

	public int pointCheck(String user_serial_num) {
		return dao.pointCheck(user_serial_num);
	}
	
}
