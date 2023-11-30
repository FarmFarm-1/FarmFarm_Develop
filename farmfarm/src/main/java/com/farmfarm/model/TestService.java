package com.farmfarm.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmfarm.dto.UsersVO;

@Service
public class TestService {
	
	@Autowired
	TestDAO dao;
	
	public int testInsert(UsersVO vo) {
		return dao.testInsert(vo);
	}

	public List<UsersVO> getAllUsers() {
		return dao.getAllUsers();
	}
}
