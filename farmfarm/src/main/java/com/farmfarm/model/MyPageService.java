package com.farmfarm.model;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmfarm.dto.User_cartVO;

@Service
public class MyPageService {

	@Autowired
	MyPageDAO myPageDAO;
	
	public int addMyCart(User_cartVO user_cartVO) {
		return myPageDAO.addMyCart(user_cartVO);
	}
	
	public int deletecart(User_cartVO user_cartVO) {
		return myPageDAO.deletecart(user_cartVO);
	}
	
	public int bookmarkCnt(String product_serial_num) {
		return myPageDAO.bookmarkCnt(product_serial_num);
	}
	
	public int pointCheck(String user_serial_num) {
		return myPageDAO.pointCheck(user_serial_num);
	}
	
	public int myBookmarkShow(String product_serial_num, String user_serial_num) {
		HashMap<String, Object> data = new HashMap<>();
		data.put("user_serial_num", user_serial_num);
		data.put("product_serial_num", product_serial_num);
		return myPageDAO.myBookmarkShow(data);
	}
	
	//cart
	public List<String> myBookmarkShowList(String user_serial_num) {
		return myPageDAO.myBookmarkShowList(user_serial_num);
	}

	public List<String> myBookmarkShowByUser(String user_serial_num) {
		return myPageDAO.myBookmarkShowByUser(user_serial_num);
	}
	
	

}
