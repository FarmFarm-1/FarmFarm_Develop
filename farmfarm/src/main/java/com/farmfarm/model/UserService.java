package com.farmfarm.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmfarm.dto.UsersVO;

@Service
public class UserService {
	
	@Autowired
	UserDAO dao;
	
	public UsersVO loginUser(UsersVO vo) {
		return dao.loginUser(vo);
	}
	
	public int testInsert(UsersVO vo) {
		return dao.userInsert(vo);
	}

	public List<UsersVO> getAllUsers() {
		return dao.getAllUsers();
	}
	
	public int userpoint(Map<String,Object> userpoint) {
		return dao.userpoint(userpoint);
	}
}
