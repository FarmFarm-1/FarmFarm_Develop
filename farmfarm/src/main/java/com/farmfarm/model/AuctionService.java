package com.farmfarm.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmfarm.dto.User_cartVO;

@Service
public class AuctionService {

	@Autowired
	AuctionDAO dao;
	
	//cart
	public int addMyCart(User_cartVO user_cartVO) {
		return dao.addMyCart(user_cartVO);
	}
	
	public int deletecart(User_cartVO user_cartVO) {
		return dao.deletecart(user_cartVO);
	}

	public int bookmarkCnt(String product_serial_num) {
		return dao.bookmarkCnt(product_serial_num);
	}

	public List<String> myBookmarkShowList(String user_serial_num) {
		return dao.myBookmarkShowList(user_serial_num);
		
	}
	
	public int pointCheck(String user_serial_num) {
		return dao.pointCheck(user_serial_num);
	}

	// auction
	public List<Map<String, Object>> auctionListSelectAll(String type) {
		return dao.auctionListSelectAll(type);
	}

	public List<Map<String, Object>> auctionListSelectHot() {
		return dao.auctionListSelectHot();
	}

	public List<Map<String, Object>> auctionListSelectSupport(String type) {
		return dao.auctionListSelectSupport(type);
	}

	public List<Map<String, Object>> auctionListSelectClosing(String type) {
		return dao.auctionListSelectClosing(type);
	}

	public List<Map<String, Object>> auctionListSelectAmount(String type) {
		return dao.auctionListSelectAmount(type);
	}

	public List<Map<String, Object>> auctionListSelectRecent(String type) {
		return dao.auctionListSelectRecent(type);
	}

	public List<Map<String, Object>> auctionListSelectByType(String type) {
		return dao.auctionListSelectByType(type);
	}
	
	public List<Map<String, Object>> auctionSearch(String input) {
		return dao.auctionSearch(input);
	}


	

}
