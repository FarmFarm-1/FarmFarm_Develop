package com.farmfarm.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.farmfarm.dto.FarmersVO;
import com.farmfarm.model.FarmerService;

@Controller
@RequestMapping("/farmer")
public class FarmerLoginController {
	
	@Autowired
	FarmerService service;
	Logger logger = LoggerFactory.getLogger(FarmerLoginController.class);
	
	@PostMapping("/farmerInput")
	public String inputfarmerTest(FarmersVO vo) {
		service.testInsert(vo);
		return "redirect:/";
	}
	
	@GetMapping("/getAllFarmers")
	public List<FarmersVO> getAllFarmers() {
		
		return service.getAllFarmers();
	}
}
