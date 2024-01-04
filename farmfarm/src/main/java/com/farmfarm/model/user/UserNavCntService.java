package com.farmfarm.model.user;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserNavCntService {
	
	@Autowired
	UserNavCntDAO dao;
	
	public HashMap<String,Object> getUserInfo(String user_serial_num){
		return dao.getUserInfo(user_serial_num);
	}

}
