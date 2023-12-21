package com.farmfarm.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class jaehoService {
	@Autowired
	jaehoDAO dao;

	public List<Map<String, Object>> depositList_farmer(String farmer_serial_num) {
		return dao.depositList_farmer(farmer_serial_num);
	}
}
