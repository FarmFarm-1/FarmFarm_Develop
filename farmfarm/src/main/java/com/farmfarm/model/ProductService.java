package com.farmfarm.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmfarm.dto.Farm_and_productVO;
import com.farmfarm.dto.User_cartVO;

@Service
public class ProductService {

	@Autowired
	ProductDAO dao;
	
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

	// funding
	public List<Map<String, Object>> fundingListSelectAll(String type) {
		return dao.fundingListSelectAll(type);
	}

	public List<Map<String, Object>> fundingListSelectHot() {
		return dao.fundingListSelectHot();
	}

	public List<Map<String, Object>> fundingListSelectSupport(String type) {
		return dao.fundingListSelectSupport(type);
	}

	public List<Map<String, Object>> fundingListSelectClosing(String type) {
		return dao.fundingListSelectClosing(type);
	}

	public List<Map<String, Object>> fundingListSelectAmount(String type) {
		return dao.fundingListSelectAmount(type);
	}

	public List<Map<String, Object>> fundingListSelectRecent(String type) {
		return dao.fundingListSelectRecent(type);
	}

	public List<Map<String, Object>> fundingListSelectByType(String type) {
		return dao.fundingListSelectByType(type);
	}
	
	public List<Map<String, Object>> fundingSearch(String input) {
		return dao.fundingSearch(input);
	}


}
