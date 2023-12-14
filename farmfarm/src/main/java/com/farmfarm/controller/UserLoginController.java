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

import com.farmfarm.dto.UsersVO;
import com.farmfarm.model.UserService;

@Controller
@RequestMapping("/user")
public class UserLoginController {
	
	@Autowired
	UserService service;
	Logger logger = LoggerFactory.getLogger(UserLoginController.class);
	
	@GetMapping("/userLogout")
	public String userLogout(HttpSession session, RedirectAttributes rttr) {
		session.removeAttribute("serial_num");
		rttr.addFlashAttribute("message", "user 로그아웃 성공");
		return "redirect:/";
	}
	
	
	@PostMapping("/userLogin")
	public String loginUserTest(UsersVO vo, HttpSession session, RedirectAttributes rttr) {
		UsersVO result = service.loginUser(vo);
		if (result != null) {
			session.setAttribute("serial_num", result.getUser_serial_num());
			rttr.addFlashAttribute("message", "user 로그인 성공");
			return "redirect:/";
		} else {
			rttr.addFlashAttribute("message", "user 로그인 실패");
			return "redirect:/";
		}
		
	}
	
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