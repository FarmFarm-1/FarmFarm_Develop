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
import com.farmfarm.model.UserService;

@Controller
@RequestMapping("/user")
public class UserLoginController {
	
	@Autowired
	UserService service;
	Logger logger = LoggerFactory.getLogger(UserLoginController.class);
	
	@PostMapping("/userInput")
	public String inputUserTest(UsersVO vo) {
		service.testInsert(vo);
		return "redirect:/";
	}
	
	@GetMapping("/getAllUsers")
	public List<UsersVO> getAllUsers() {
		
		return service.getAllUsers();
	}
}
