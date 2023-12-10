package com.farmfarm.controller;

import java.util.List;
import java.util.Map;

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
	AuctionService auctionService;
	
	
	@GetMapping("/auctionList")
	public String showauctionList(Model model) {
		String type = null;
		List<Map<String, Object>> auctionList = (List<Map<String, Object>>) auctionService.auctionListSelectAll(type);
		model.addAttribute("auctionList", auctionList);
		return "auction/auctionList";
	}
	
	@GetMapping("/auctionListByType")
	public String fundingListByType(String type, Model model) {
		List<Map<String, Object>> auctionList = (List<Map<String, Object>>) auctionService.auctionListSelectByType(type);
		/*
		 * for (Map<String, Object> map : fundingList) { if (map.get("funding_pct") ==
		 * null) { map.put("funding_pct", 0); } }
		 */
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
		/*
		 * for (Map<String, Object> map : fundingList) { if (map.get("funding_pct") ==
		 * null) { map.put("funding_pct", 0); } }
		 */
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
		model.addAttribute("fundingList", auctionList);
		return "auction/auctionList_ajax";
	}

}
