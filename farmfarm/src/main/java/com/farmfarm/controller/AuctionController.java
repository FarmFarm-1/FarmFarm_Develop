package com.farmfarm.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmfarm.dto.Auction_historyVO;
import com.farmfarm.exception.AuctionException;
import com.farmfarm.model.AuctionService;

@Controller
@RequestMapping("/auction")
public class AuctionController {
	
	@Autowired
	AuctionService auctionService;
	
	@ExceptionHandler(AuctionException.class)
	public ResponseEntity<String> handleAllExceptions(Exception e) {
	    return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
	}
	
	@GetMapping("/auctionList")
	public String showAuctionList(Model model) {
		
		model.addAttribute("auctionList", auctionService.auctionListSelectAll());
		return "auction/auctionList";
	}
	
	@GetMapping("/auctionDetail")
	public String auctionDetail(String product_serial_num, Model model, HttpSession session) {
		Map<String, Object> auctionInfo = (Map<String, Object>)auctionService.auctionInfo(product_serial_num);
		model.addAttribute("maxAndCntInfo", auctionService.maxAndCntAuctionInfo(product_serial_num));
		model.addAttribute("bookmarkCnt", auctionService.bookmarkCnt(product_serial_num));
		model.addAttribute("cropsquoteInfo", auctionService.cropsquoteInfo((String)auctionInfo.get("product_kind")));
		String user_serial_num = (String)session.getAttribute("serial_num");
		if(user_serial_num != null) {
			if(user_serial_num.substring(0,2).equals("us")) {
				int myBookmarkShow = auctionService.myBookmarkShow(product_serial_num, user_serial_num);
				model.addAttribute("myBookmarkShow",myBookmarkShow);
			}
		}		
		//���ѹ� ��� ��� ����
		String farmer_phone_origin = (String)auctionInfo.get("farmer_phone");
		String farmer_phone = farmer_phone_origin.replaceAll("(\\d{3})(\\d{4})(\\d{4})", "$1-$2-$3");
		auctionInfo.replace("farmer_phone", farmer_phone);
		model.addAttribute("auctionInfo", auctionInfo);
		
		//user_name ��¾�� ����
		List<Map<String, Object>> auctionHistoryInfo = auctionService.auctionHistorySelectAll(product_serial_num);

		for (Map<String, Object> history : auctionHistoryInfo) {
		    String user_name_origin = (String) history.get("user_name");
		    StringBuilder sb = new StringBuilder();
		    sb.append(user_name_origin.substring(0, 1)).append("**");
		    history.replace("user_name", sb.toString());
		}
		model.addAttribute("auctionHistoryInfo", auctionHistoryInfo);
		
		return "auction/auctionDetail";
	}
	
	@ResponseBody
	@PostMapping("/auctionConfirm")
	public ResponseEntity<String> auctionConfirm(Auction_historyVO auction_historyVO) {
		String result = Integer.toString(auctionService.auctionConfirm(auction_historyVO));
		return ResponseEntity.ok(result);
	}

}