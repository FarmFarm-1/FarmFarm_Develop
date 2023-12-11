package com.farmfarm.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.farmfarm.dto.UsersVO;
import com.farmfarm.model.TestService;

@Controller
@RequestMapping("/test")
public class TestController {
	
	@Autowired
	TestService service;
	Logger logger = LoggerFactory.getLogger(TestController.class);
	
	@PostMapping("/testInput")
	public String inputUserTest(UsersVO vo) {
		
		System.out.println(vo.getUser_email());
		service.testInsert(vo);
		return "redirect:/";
	}
	
	@GetMapping("/getAllUsers")
	public List<UsersVO> getAllUsers() {
		
		return service.getAllUsers();
	}
}
