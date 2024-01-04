package com.farmfarm.model.auction;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.farmfarm.dto.Auction_historyVO;
import com.farmfarm.dto.Crops_quoteVO;
import com.farmfarm.dto.Farm_and_productVO;
import com.farmfarm.exception.TransactionException;

@Repository
public class AuctionDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	String namespace_auction = "com.farmfarm.Auction.";
	String namespace_cropsQuote = "com.farmfarm.Crops_quoteVO.";
	String namespace_myPage = "com.farmfarm.myPage.";
	
	//hs code
	public Map<String, Object> auctionInfo(String product_serial_num) {
		return sqlSession.selectOne(namespace_auction+"auctionInfo",product_serial_num);
	}
	
	public List<Map<String, Object>> auctionHistorySelectAll(String product_serial_num) {
		return sqlSession.selectList(namespace_auction+"auctionHistorySelectAll",product_serial_num);
	}
	
	public Map<String, Object> maxAndCntAuctionInfo(String product_serial_num) {
		return sqlSession.selectOne(namespace_auction+"maxAndCntAuctionInfo", product_serial_num);
	}

	public Crops_quoteVO cropsquoteInfo(String product_kind) {
		return sqlSession.selectOne(namespace_cropsQuote+"cropsquoteInfo", product_kind);
	}
	
	@Transactional
	public int auctionConfirm(Auction_historyVO auction_historyVO) {
		
		//현 보유 포인트 체크
		HashMap<String, Object> map = new HashMap<>();
		map.put("user_serial_num", auction_historyVO.getUser_serial_num());
		map.put("user_point", auction_historyVO.getUser_price());
		int pointEnoughChk = sqlSession.selectOne(namespace_myPage+"pointCheckForAuction", map);
		if (pointEnoughChk != 1) {
			throw new TransactionException("notEnoughPoint");
		}
		//최고금액 check
		int maxAuctionPriceChk = sqlSession.selectOne(namespace_auction+"maxAuctionPriceCheck", auction_historyVO);
		if (maxAuctionPriceChk != 1) {
			throw new TransactionException("notMaxAuctionraiser");
		}
		return maxAuctionPriceChk;
		
	}
	@Transactional
	public int auctionStatusChange(Auction_historyVO auction_historyVO) {
		//이전 최고금액 입찰자의 상태 변경
		if((Integer)sqlSession.selectOne(namespace_auction+"selectParticipantCntByPrID",auction_historyVO) > 0 ) {
			int updateStatusResult = sqlSession.update(namespace_auction+"updateCurMaxPriceStatus", auction_historyVO.getProduct_serial_num());
			if (updateStatusResult != 1) {
				throw new TransactionException("notUpdatedAuctionStatus");
			}
		}
		
		int auctionConfirm = sqlSession.insert(namespace_auction+"auctionHistoryInsert", auction_historyVO);
		if(auctionConfirm != 1) {
			throw new TransactionException("notInsertCompleted");
		}

		return auctionConfirm;
	}
	
	//jiwon
	//auction
	public List<Map<String, Object>> auctionListSelectAll(String type) {
		if (type == null) {			
			return sqlSession.selectList(namespace_auction+"auctionListSelectAll");
		}
		if (type.equals("all")) {
			return sqlSession.selectList(namespace_auction+"auctionListSelectByTypeAll");
		} else {
			return sqlSession.selectList(namespace_auction+"auctionListSelectByType", type);
		}
	}
	
	public List<Map<String, Object>> auctionListSelectHot() {
		return sqlSession.selectList(namespace_auction+"auctionListSelectHot");
	}
	
	public List<Map<String, Object>> auctionListSelectSupport(String type) {
		if (type == null || type.equals("all")) {			
			return sqlSession.selectList(namespace_auction+"auctionListSelectSupport");
		} else {
			return sqlSession.selectList(namespace_auction+"auctionListSelectByTypeSupport", type);			
		}
	}
	
	public List<Map<String, Object>> auctionListSelectClosing(String type) {
		if (type == null || type.equals("all")) {				
			return sqlSession.selectList(namespace_auction+"auctionListSelectClosing");
		} else {
			return sqlSession.selectList(namespace_auction+"auctionListSelectByTypeClosing", type);
		}
	}
	
	public List<Map<String, Object>> auctionListSelectAmount(String type) {
		if (type == null || type.equals("all")) {	
			return sqlSession.selectList(namespace_auction+"auctionListSelectAmount");
		} else {
			return sqlSession.selectList(namespace_auction+"auctionListSelectByTypeAmount", type);
		}
	}
	
	public List<Map<String, Object>> auctionListSelectRecent(String type) {
		if (type == null || type.equals("all")) {	
			return sqlSession.selectList(namespace_auction+"auctionListSelectRecent");
		} else {
			return sqlSession.selectList(namespace_auction+"auctionListSelectByType", type);
		}
	}
	
	public List<Map<String, Object>> auctionListSelectByType(String type) {
		if (type.equals("all")) {
			return sqlSession.selectList(namespace_auction+"auctionListSelectByTypeAll");
		}else {
			return sqlSession.selectList(namespace_auction+"auctionListSelectByType", type);
		}
	}
	
	public List<Map<String, Object>> auctionSearch(String input) {
		return sqlSession.selectList(namespace_auction+"auctionSearch", input);
	}

}