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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmfarm.dto.Auction_historyVO;
import com.farmfarm.exception.AuctionException;
import com.farmfarm.model.AuctionService;
import com.farmfarm.model.MyPageService;

@Controller
@RequestMapping("/auction")
public class AuctionController {
	
	@Autowired
	AuctionService auctionService;
	
	@Autowired
	MyPageService myPageService;
	
	//hs code
	@ExceptionHandler(AuctionException.class)
	public ResponseEntity<String> handleAllExceptions(Exception e) {
	    return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
	}

	@GetMapping("/auctionDetail")
	public String auctionDetail(String product_serial_num, Model model, HttpSession session) {
		
		System.out.println("con : "+product_serial_num);
		
		Map<String, Object> auctionInfo = (Map<String, Object>) auctionService.auctionInfo(product_serial_num);
		
		model.addAttribute("maxAndCntInfo", auctionService.maxAndCntAuctionInfo(product_serial_num));
		model.addAttribute("bookmarkCnt", myPageService.bookmarkCnt(product_serial_num));
		model.addAttribute("cropsquoteInfo", auctionService.cropsquoteInfo((String)auctionInfo.get("product_kind")));
		String user_serial_num = (String)session.getAttribute("serial_num");
		if(user_serial_num != null) {
			if(user_serial_num.substring(0,2).equals("us")) {
				int myBookmarkShow = myPageService.myBookmarkShow(product_serial_num, user_serial_num);
				model.addAttribute("myBookmarkShow",myBookmarkShow);
			}
		}
		//폰넘버 출력 양식 변경
		String farmer_phone_origin = (String)auctionInfo.get("farmer_phone");
		String farmer_phone = farmer_phone_origin.replaceAll("(\\d{3})(\\d{4})(\\d{4})", "$1-$2-$3");
		auctionInfo.replace("farmer_phone", farmer_phone);
		model.addAttribute("auctionInfo", auctionInfo);
		
		//user_name 출력양식 변경
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
	
	//jw code
	@GetMapping("/auctionList")
	public String showauctionList(Model model) {
		String type = null;
		List<Map<String, Object>> auctionList = (List<Map<String, Object>>) auctionService.auctionListSelectAll(type);
		model.addAttribute("auctionList", auctionList);
		return "auction/auctionList";
	}
	
	@GetMapping("/auctionListByType")
	public String auctionListByType(String type, Model model) {
		List<Map<String, Object>> auctionList = (List<Map<String, Object>>) auctionService.auctionListSelectByType(type);
		model.addAttribute("auctionList", auctionList);
		return "auction/auctionList_ajax";
	}
	
	@GetMapping("/auctionMain")
	public String showAuctionMain(Model model) {
		List<Map<String, Object>> auctionList = (List<Map<String, Object>>)auctionService.auctionListSelectHot();
		model.addAttribute("auctionListHot", auctionList);
		return "auction/auctionMain";
	}
	
	@GetMapping("/orderAll")
	public String showFilter1(String type, Model model) {
		List<Map<String, Object>> auctionList = (List<Map<String, Object>>) auctionService.auctionListSelectAll(type);
		model.addAttribute("auctionList", auctionList);
		System.out.println(model);
		return "auction/auctionList_ajax";
	}
	
	 
	@GetMapping("/orderSupport")
	public String showFilter2(String type, Model model) {
		List<Map<String, Object>> auctionList = (List<Map<String, Object>>) auctionService.auctionListSelectSupport(type);
		
		model.addAttribute("auctionList", auctionList);
		return "auction/auctionList_ajax";
	}
	
	@GetMapping("/orderClosing")
	public String showFilter3(String type, Model model) {
		List<Map<String, Object>> auctionList = (List<Map<String, Object>>) auctionService.auctionListSelectClosing(type);
		
		model.addAttribute("auctionList", auctionList);
		return "auction/auctionList_ajax";
	}
	
	@GetMapping("/orderAmount")
	public String showFilter4(String type, Model model) {
		
		List<Map<String, Object>> auctionList = (List<Map<String, Object>>) auctionService.auctionListSelectAmount(type);
		
		model.addAttribute("auctionList", auctionList);
		return "auction/auctionList_ajax";
	}
	
	@GetMapping("/orderRecent")
	public String showFilter5(String type, Model model) {
		
		List<Map<String, Object>> auctionList = (List<Map<String, Object>>) auctionService.auctionListSelectRecent(type);
		
		model.addAttribute("auctionList", auctionList);
		return "auction/auctionList_ajax";
	}
	
	@GetMapping("/auctionSearch")
	public String auctionSearch(String input, Model model) {
		
		List<Map<String, Object>> auctionList = (List<Map<String, Object>>) auctionService.auctionSearch(input);
		
		System.out.println(auctionList);
		model.addAttribute("auctionList", auctionList);
		return "auction/auctionList_ajax";
	}

}
