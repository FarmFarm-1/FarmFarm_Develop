package com.farmfarm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.farmfarm.model.ProductService;

@Controller
@RequestMapping("/funding")
public class FundingController {
	
	@Autowired
	ProductService productService;
	
	@GetMapping("/fundingList")
	public String showFundingList(Model model) {
		model.addAttribute("fundingList", productService.fundingListSelectAll());
		return "funding/fundingList";
	}

}
