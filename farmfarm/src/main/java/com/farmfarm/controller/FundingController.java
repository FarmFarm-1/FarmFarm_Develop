package com.farmfarm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.farmfarm.model.FundingService;

@Controller
@RequestMapping("/funding")
public class FundingController {
	
	@Autowired
	FundingService productService;
	
	@GetMapping("/fundingList")
	public String showFundingList(String product_serial_num,Model model) {
		model.addAttribute("fundingInfo", productService.fundingInfo(product_serial_num));
		return "funding/fundingList";
	}

	@GetMapping("/fundingDetail")
	public String showFundingDetail(String product_serial_num,Model model) {
		model.addAttribute("fundingInfo", productService.fundingInfo(product_serial_num));
		return "funding/fundingDetail";
	}
	@GetMapping("/fundingFinish")
	public String showmain() {
		return "funding/fundingFinish";
	}
}
