package com.farmfarm.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.farmfarm.model.ProductService;

@Controller
@RequestMapping("/auction")
public class AuctionController {
	
	@Autowired
	ProductService productService;
	
	@GetMapping("/auctionList")
	public String showAuctionList(Model model) {
		
		model.addAttribute("auctionList", productService.auctionListSelectAll());
		return "auction/auctionList";
	}
	
	@GetMapping("/auctionDetail")
	public String auctionDetail(String product_serial_num, Model model) {
		Map<String, Object> auctionInfo = (Map<String, Object>)productService.auctionInfo(product_serial_num);
		List<Map<String, Object>> auctionHistoryInfo = productService.auctionHistorySelectAll(product_serial_num);
		model.addAttribute("maxAndCntInfo", productService.maxAndCntAuctionInfo(product_serial_num));
		
		String farmer_phone_origin = (String)auctionInfo.get("farmer_phone");
		String farmer_phone = farmer_phone_origin.replaceAll("(\\d{3})(\\d{4})(\\d{4})", "$1-$2-$3");
		auctionInfo.replace("farmer_phone", farmer_phone);
		
		for (Map<String, Object> history : auctionHistoryInfo) {
		    String user_name_origin = (String) history.get("user_name");
		    String user_name = user_name_origin.substring(0, 1) + user_name_origin.substring(1).replaceAll("\\p{L}", "*");
		    history.replace("user_name", user_name);
		}
		model.addAttribute("auctionInfo", auctionInfo);
		model.addAttribute("auctionHistoryInfo", auctionHistoryInfo);
		return "auction/auctionDetail";
	}

}
