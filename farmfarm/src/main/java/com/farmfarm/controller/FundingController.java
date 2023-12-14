package com.farmfarm.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.farmfarm.model.FundingService;

@Controller
@RequestMapping("/funding")
public class FundingController {
	
	@Autowired
	FundingService fundingService;
	
	@GetMapping("/fundingList")
	public String showFundingList(Model model) {
		String type = null;
		List<Map<String, Object>> fundingList = (List<Map<String, Object>>) fundingService.fundingListSelectAll(type);
		for (Map<String, Object> map : fundingList) {
		    if (map.get("funding_pct") == null) {
		        map.put("funding_pct", 0);
		    }
		}		
		model.addAttribute("fundingList", fundingList);
		return "funding/fundingList";
	}
	
	@GetMapping("/fundingListByType")
	public String fundingListByType(String type, Model model) {
		List<Map<String, Object>> fundingList = (List<Map<String, Object>>) fundingService.fundingListSelectByType(type);
		for (Map<String, Object> map : fundingList) {
		    if (map.get("funding_pct") == null) {
		        map.put("funding_pct", 0);
		    }
		}		
		model.addAttribute("fundingList", fundingList);
		return "funding/fundingList_ajax";
	}
	
	@GetMapping("/fundingMain")
	public String showFundingMain(Model model) {
		List<Map<String, Object>> fundingList = (List<Map<String, Object>>)fundingService.fundingListSelectHot();
		model.addAttribute("fundingListHot", fundingList);
		return "funding/fundingMain";
	}
	
	@GetMapping("/orderAll")
	public String showFundingFilter1(String type, Model model) {
		List<Map<String, Object>> fundingList = (List<Map<String, Object>>) fundingService.fundingListSelectAll(type);
		for (Map<String, Object> map : fundingList) {
		    if (map.get("funding_pct") == null) {
		        map.put("funding_pct", 0);
		    }
		}
		model.addAttribute("fundingList", fundingService.fundingListSelectAll(type));
		System.out.println(model);
		return "funding/fundingList_ajax";
	}
	
	 
	@GetMapping("/orderSupport")
	public String showFundingFilter2(String type, Model model) {
		List<Map<String, Object>> fundingList = (List<Map<String, Object>>) fundingService.fundingListSelectSupport(type);
		for (Map<String, Object> map : fundingList) {
		    if (map.get("funding_pct") == null) {
		        map.put("funding_pct", 0);
		    }
		}
		model.addAttribute("fundingList", fundingList);
		return "funding/fundingList_ajax";
	}
	
	@GetMapping("/orderClosing")
	public String showFundingFilter3(String type, Model model) {
		List<Map<String, Object>> fundingList = (List<Map<String, Object>>) fundingService.fundingListSelectClosing(type);
		for (Map<String, Object> map : fundingList) {
		    if (map.get("funding_pct") == null) {
		        map.put("funding_pct", 0);
		    }
		}
		model.addAttribute("fundingList", fundingList);
		return "funding/fundingList_ajax";
	}
	
	@GetMapping("/orderAmount")
	public String showFundingFilter4(String type, Model model) {
		
		List<Map<String, Object>> fundingList = (List<Map<String, Object>>) fundingService.fundingListSelectAmount(type);
		for (Map<String, Object> map : fundingList) {
		    if (map.get("funding_pct") == null) {
		        map.put("funding_pct", 0);
		    }
		}
		model.addAttribute("fundingList", fundingList);
		return "funding/fundingList_ajax";
	}
	
	@GetMapping("/orderRecent")
	public String showFundingFilter5(String type, Model model) {
		
		List<Map<String, Object>> fundingList = (List<Map<String, Object>>) fundingService.fundingListSelectRecent(type);
		for (Map<String, Object> map : fundingList) {
		    if (map.get("funding_pct") == null) {
		        map.put("funding_pct", 0);
		    }
		}
		model.addAttribute("fundingList", fundingList);
		return "funding/fundingList_ajax";
	}
	
	@GetMapping("/fundingSearch")
	public String fundingSearch(String input, Model model) {
		
		List<Map<String, Object>> fundingList = (List<Map<String, Object>>) fundingService.fundingSearch(input);
		for (Map<String, Object> map : fundingList) {
		    if (map.get("funding_pct") == null) {
		        map.put("funding_pct", 0);
		    }
		}
		System.out.println(fundingList);
		model.addAttribute("fundingList", fundingList);
		return "funding/fundingList_ajax";
	}

}
