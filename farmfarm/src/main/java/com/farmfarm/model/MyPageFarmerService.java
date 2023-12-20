package com.farmfarm.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyPageFarmerService {

	@Autowired
	MyPageFarmerDAO MyPageFarmerDAO;
	
	public List<Map<String, Object>> selectProjectList(String farmer_serial_num) {
		return MyPageFarmerDAO.selectProjectList(farmer_serial_num);
	}
}
