package com.farmfarm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.farmfarm.dto.FarmersVO;
import com.farmfarm.model.FarmerService;

@Controller
@RequestMapping("/farmer")
public class FarmerLoginController {
	
	@Autowired
	FarmerService service;
	Logger logger = LoggerFactory.getLogger(FarmerLoginController.class);
	
	@GetMapping("farmerLogout")
	public String farmerLogout(HttpSession session, RedirectAttributes rttr) {
		session.invalidate();
		rttr.addFlashAttribute("message", "farmer �α׾ƿ� ����");
		return "redirect:/";
	}
	
	@PostMapping("/farmerInput")
	public String inputfarmerTest(FarmersVO vo) {
		service.testInsert(vo);
		return "redirect:/";
	}
	
	@PostMapping("/farmerLogin")
	public String loginFarmerTest(FarmersVO vo, HttpSession session, RedirectAttributes rttr) {
		FarmersVO result = service.loginFarmer(vo);
		if (result != null) {
			session.setAttribute("serial_num", result.getFarmer_serial_num());
			rttr.addFlashAttribute("message", "farmer �α��� ����");
		} else {
			rttr.addFlashAttribute("message", "farmer �α��� ����");
		}
		return "redirect:/";
		
	}
	
	
	@GetMapping("/getAllFarmers")
	public List<FarmersVO> getAllFarmers() {
		
		return service.getAllFarmers();
	}
}
