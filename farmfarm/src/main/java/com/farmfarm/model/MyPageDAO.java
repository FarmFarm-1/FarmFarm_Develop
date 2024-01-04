package com.farmfarm.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.farmfarm.dto.Farmer_account_historyVO;
import com.farmfarm.dto.User_account_historyVO;
import com.farmfarm.dto.User_cartVO;
import com.farmfarm.dto.UsersVO;

@Repository
public class MyPageDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	String namespace_myPage = "com.farmfarm.myPage.";
	
	public int addMyCart(User_cartVO user_cartVO) {
		return sqlSession.insert(namespace_myPage+"addMyCart", user_cartVO);
	}
	
	public int deletecart(User_cartVO user_cartVO) {
		return sqlSession.delete(namespace_myPage+"deletecart", user_cartVO);
	}

	public int bookmarkCnt(String product_serial_num) {
		return sqlSession.selectOne(namespace_myPage+"bookmarkCnt",product_serial_num);
	}

	public int pointCheck(String user_serial_num) {
		return sqlSession.selectOne(namespace_myPage+"pointCheck",user_serial_num);
	}
	
	public int myBookmarkShow(HashMap<String, Object> data) {
		return sqlSession.selectOne(namespace_myPage+"myBookmarkShow",data);
	}
	//jw
	public List<String> myBookmarkShowList(String user_serial_num) {
		return sqlSession.selectList(namespace_myPage+"myBookmarkShowList",user_serial_num);
	}

	public List<String> myBookmarkShowByUser(String user_serial_num) {
		return sqlSession.selectList(namespace_myPage+"myBookmarkShowByUser",user_serial_num);
	}

	public int chargePointCfrm(Map<String, Object> data) {
		try {
	        return sqlSession.insert(namespace_myPage+"chargePointCfrm",data);
	    } catch (Exception e) {
	    	System.out.println("chargePointCfrm error : " + e.getMessage());
	        return -1;
	    }
	}

	public UsersVO getUserInfoForChargingPoint(String user_serial_num) {
		return sqlSession.selectOne(namespace_myPage+"getUserInfoForChargingPoint",user_serial_num);
	}
	
	public User_account_historyVO accountExistenceUser(String user_serial_num) {
		return sqlSession.selectOne(namespace_myPage+"latestAccountSelectUser",user_serial_num);
	}
	
	public String getUserInfoForVerifyAccount(String user_serial_num) {
		return sqlSession.selectOne(namespace_myPage+"getUserInfoForVerifyAccount",user_serial_num);
	}
	
	public int registerAccountUser(HashMap<String, String> sqlInputData) {
		return sqlSession.insert(namespace_myPage+"registerAccountUser",sqlInputData);
	}
	
	public Farmer_account_historyVO accountExistenceFarmer(String user_serial_num) {
		return sqlSession.selectOne(namespace_myPage+"latestAccountSelectFarmer",user_serial_num);
	}

	public String getFarmerInfoForVerifyAccount(String serial_num) {
		return sqlSession.selectOne(namespace_myPage+"getFarmerInfoForVerifyAccount",serial_num);
	}
	
	public int registerAccountFarmer(HashMap<String, String> sqlInputData) {
		return sqlSession.insert(namespace_myPage+"registerAccountFarmer",sqlInputData);
	}
	
	public Farmer_account_historyVO checkAccountForRegisterProduct(String serial_num) {
		return sqlSession.selectOne(namespace_myPage+"latestAccountSelectFarmer",serial_num);
	}

}
