package com.farmfarm.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmfarm.dto.Auction_historyVO;
import com.farmfarm.dto.Crops_quoteVO;

@Service
public class AuctionService {

	@Autowired
	AuctionDAO dao;
	
	//hs code
	public Map<String, Object> auctionInfo(String product_serial_num) {
		return dao.auctionInfo(product_serial_num);
	}
	
	public List<Map<String, Object>> auctionHistorySelectAll(String product_serial_num) {
		return dao.auctionHistorySelectAll(product_serial_num);
	}
	
	public Map<String, Object> maxAndCntAuctionInfo(String product_serial_num) {
		return dao.maxAndCntAuctionInfo(product_serial_num);
	}

	public Crops_quoteVO cropsquoteInfo(String product_kind) {
		return dao.cropsquoteInfo(product_kind);
	}

	public int auctionConfirm(Auction_historyVO auction_historyVO) {
		return dao.auctionConfirm(auction_historyVO);
	}
	
	public int auctionStatusChange(Auction_historyVO auction_historyVO) {
		return dao.auctionStatusChange(auction_historyVO);
	}

	//jiwon code
	// auction
	public List<Map<String, Object>> auctionListSelectAll(String type) {
		return dao.auctionListSelectAll(type);
	}

	public List<Map<String, Object>> auctionListSelectHot() {
		return dao.auctionListSelectHot();
	}

	public List<Map<String, Object>> auctionListSelectSupport(String type) {
		return dao.auctionListSelectSupport(type);
	}

	public List<Map<String, Object>> auctionListSelectClosing(String type) {
		return dao.auctionListSelectClosing(type);
	}

	public List<Map<String, Object>> auctionListSelectAmount(String type) {
		return dao.auctionListSelectAmount(type);
	}

	public List<Map<String, Object>> auctionListSelectRecent(String type) {
		return dao.auctionListSelectRecent(type);
	}

	public List<Map<String, Object>> auctionListSelectByType(String type) {
		return dao.auctionListSelectByType(type);
	}
	
	public List<Map<String, Object>> auctionSearch(String input) {
		return dao.auctionSearch(input);
	}
	
}
