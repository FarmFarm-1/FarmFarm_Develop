package com.farmfarm.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmfarm.dto.Farm_and_productVO;

@Service
public class FundingService {
	
	@Autowired
	FundingDAO dao;
	
	public List<Farm_and_productVO> fundingListSelectAll() {
		return dao.fundingListSelectAll();
	}

	public Map<String, Object> fundingInfo(String product_serial_num) {
		return dao.fundingInfo(product_serial_num);
	}
}
