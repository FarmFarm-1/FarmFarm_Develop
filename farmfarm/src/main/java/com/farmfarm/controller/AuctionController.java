package com.farmfarm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.farmfarm.model.AuctionService;

@Controller
@RequestMapping("/auction")
public class AuctionController {
	
	@Autowired
	AuctionService productService;
	
	@GetMapping("/auctionList")
	public String showAuctionList(Model model) {
		
		model.addAttribute("auctionList", productService.auctionListSelectAll());
		return "auction/auctionList";
	}
	
	@GetMapping("/auctionDetail")
	public String auctionDetail(String product_serial_num,Model model) {
		model.addAttribute("auctionInfo", productService.auctionInfo(product_serial_num));
		return "auction/auctionDetail";
	}

}
