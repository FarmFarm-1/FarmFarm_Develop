package com.farmfarm.model;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FarmerNavCntService {

	@Autowired
	FarmerNavCntDAO dao;
	
	public HashMap<String, Object> getCnt(String farmer) {
		// TODO Auto-generated method stub
		return dao.getCnt(farmer);
	}

}
