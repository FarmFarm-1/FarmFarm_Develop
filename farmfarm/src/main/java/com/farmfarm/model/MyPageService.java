package com.farmfarm.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmfarm.dto.User_account_historyVO;
import com.farmfarm.dto.User_cartVO;
import com.farmfarm.dto.UsersVO;

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

	public int chargePointCfrm(int paid_amount, HttpSession session) {
		String user_serial_num = (String)session.getAttribute("serial_num");
		Map<String, Object> data = new HashMap<>();
		data.put("user_serial_num", user_serial_num);
		data.put("amount",paid_amount);
		int result = myPageDAO.chargePointCfrm(data);
		return result;
	}

	public UsersVO getUserInfoForChargingPoint(HttpSession session) {
		String user_serial_num = (String) session.getAttribute("serial_num");
		return myPageDAO.getUserInfoForChargingPoint(user_serial_num);
	}

	public User_account_historyVO accountExistence(HttpSession session) {
		String user_serial_num = (String) session.getAttribute("serial_num");
		return myPageDAO.accountExistence(user_serial_num);
	}
	
	

}
