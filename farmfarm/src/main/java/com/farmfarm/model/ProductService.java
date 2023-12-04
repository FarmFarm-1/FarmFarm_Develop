package com.farmfarm.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmfarm.dto.Auction_historyVO;
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

	public Map<String, Object> auctionInfo(String product_serial_num) {
		return dao.auctionInfo(product_serial_num);
	}
	
	public List<Auction_historyVO> auctionHistorySelectAll(String product_serial_num) {
		return dao.auctionHistorySelectAll(product_serial_num);
	}
	
	public Map<String, Object> maxAndCntAuctionInfo(String product_serial_num) {
		return dao.maxAndCntAuctionInfo(product_serial_num);
	}
	
}
