package com.farmfarm.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.farmfarm.dto.Auction_historyVO;
import com.farmfarm.dto.Crops_quoteVO;
import com.farmfarm.dto.Farm_and_productVO;
import com.farmfarm.dto.User_cartVO;
import com.farmfarm.exception.AuctionException;

@Repository
public class AuctionDAO {
	
	@Autowired
	SqlSession sqlSession;
	String namespace_auction = "com.farmfarm.auction.";
	String namespace_cropsQuote = "com.farmfarm.Crops_quoteVO.";
	String namespace_user = "com.farmfarm.UsersVO.";
	
	public List<Farm_and_productVO> fundingListSelectAll() {
		return sqlSession.selectList(namespace_auction+"fundingListSelectAll");
	}

	public List<Farm_and_productVO> auctionListSelectAll() {
		return sqlSession.selectList(namespace_auction+"auctionListSelectAll");
	}

	public Map<String, Object> auctionInfo(String product_serial_num) {
		return sqlSession.selectOne(namespace_auction+"auctionInfo",product_serial_num);
	}
	
	public List<Map<String, Object>> auctionHistorySelectAll(String product_serial_num) {
		return sqlSession.selectList(namespace_auction+"auctionHistorySelectAll",product_serial_num);
	}
	
	public Map<String, Object> maxAndCntAuctionInfo(String product_serial_num) {
		return sqlSession.selectOne(namespace_auction+"maxAndCntAuctionInfo", product_serial_num);
	}

	public int addMyCart(User_cartVO user_cartVO) {
		return sqlSession.insert(namespace_auction+"addMyCart", user_cartVO);
	}
	
	public int deletecart(User_cartVO user_cartVO) {
		return sqlSession.delete(namespace_auction+"deletecart", user_cartVO);
	}

	public int bookmarkCnt(String product_serial_num) {
		return sqlSession.selectOne(namespace_auction+"bookmarkCnt",product_serial_num);
	}

	public int myBookmarkShow(String product_serial_num, String user_serial_num) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("user_serial_num", user_serial_num);
		map.put("product_serial_num", product_serial_num);
		return sqlSession.selectOne(namespace_auction+"myBookmarkShow",map);
	}

	public int pointCheck(String user_serial_num) {
		return sqlSession.selectOne(namespace_auction+"pointCheck",user_serial_num);
	}

	public Crops_quoteVO cropsquoteInfo(String product_kind) {
		return sqlSession.selectOne(namespace_cropsQuote+"cropsquoteList", product_kind);
	}
	
	@Transactional
	public int auctionConfirm(Auction_historyVO auction_historyVO) {
		
		//포인트 보유 여부 check
		HashMap<String, Object> map = new HashMap<>();
		map.put("user_serial_num", auction_historyVO.getUser_serial_num());
		map.put("user_point", auction_historyVO.getUser_price());
		int pointEnoughChk = sqlSession.selectOne(namespace_user+"pointCheck", map);
		if (pointEnoughChk != 1) {
			throw new AuctionException("notEnoughPoint");
		}
		//최고 금액 여부 check
		int maxAuctionPriceChk = sqlSession.selectOne(namespace_auction+"maxAuctionPriceCheck", auction_historyVO);
		if (maxAuctionPriceChk != 1) {
			throw new AuctionException("notMaxAuctionraiser");
		}
		
		//경매 최고참여자 status 변경 & 현재 user의 값을 history에 넣기
		int updateStatusResult = sqlSession.update(namespace_auction+"updateCurMaxPriceStatus", auction_historyVO.getProduct_serial_num());
		if (updateStatusResult != 1) {
			throw new AuctionException("notUpdatedAuctionStatus");
		}
		
		int auctionConfirm = sqlSession.insert(namespace_auction+"auctionHistoryInsert", auction_historyVO);
		if(auctionConfirm != 1) {
			throw new AuctionException("notInsertCompleted");
		} 
		
		return auctionConfirm;
	}
}
