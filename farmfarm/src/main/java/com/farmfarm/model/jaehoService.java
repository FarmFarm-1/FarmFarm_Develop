package com.farmfarm.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class jaehoService {
	@Autowired
	jaehoDAO dao;

	public List<Map<String, Object>> depositList(String user_serial_num) {
		return dao.depositList(user_serial_num);
	}

	public List<Map<String, Object>> farmList(String user_serial_num) {
		return dao.farmList(user_serial_num);
	}

	public List<Map<String, Object>> showSearchDate(String user_serial_num, String startDate, String endDate) {
		return dao.showSearchDate(user_serial_num, startDate, endDate);
	}
}
