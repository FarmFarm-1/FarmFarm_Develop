package com.farmfarm.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmfarm.dto.Farm_and_productVO;

@Service
public class ProductService {
	
	@Autowired
	ProductDAO dao;
	
	public List<Farm_and_productVO> fundingListSelectAll() {
		return dao.fundingListSelectAll();
	}

	public List<Farm_and_productVO> auctionListSelectAll() {
		return dao.auctionListSelectAll();
	}

	public Farm_and_productVO auctionInfo(String product_serial_num) {
		return dao.auctionInfo(product_serial_num);
	}
	
}
