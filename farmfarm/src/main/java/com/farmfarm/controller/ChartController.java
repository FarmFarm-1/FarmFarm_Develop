package com.farmfarm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.farmfarm.model.ChartService;

@Controller
@RequestMapping("/chart")
public class ChartController {
	
	@Autowired
	ChartService chartService;
	
	@GetMapping("/area/{crops_kind}")
	public String showChart(@PathVariable("crops_kind") String crops_kind, Model model) {
		if(crops_kind.equals("rice")) {
			crops_kind = "½Ò";
		}
		model.addAttribute("cropsInfo", chartService.cropsInfoByKind(crops_kind));
		return "chart/areaChart";
	}

}
