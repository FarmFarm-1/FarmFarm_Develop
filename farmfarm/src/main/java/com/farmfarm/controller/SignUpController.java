package com.farmfarm.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmfarm.dto.FarmersVO;
import com.farmfarm.dto.TermsOfUseVO;
import com.farmfarm.dto.UsersVO;
import com.farmfarm.model.SignUpService;
import com.farmfarm.model.TermOfUseService;

@Controller
public class SignUpController {

	@Autowired
	TermOfUseService tService;
	@Autowired
	SignUpService sService;
	
	@GetMapping(value = "/termContents.do", produces = "text/plain;charset=utf-8")
	public  @ResponseBody  String getTermContent(@RequestParam("termName")  String term_name, Model model) {
		TermsOfUseVO vo = tService.getTermContent(term_name);
		return vo.getTerm_content();
		
	}
	
	@PostMapping("/emailCheck.do")
	public void emailCheck(String email, HttpServletResponse response) throws IOException {
		sService.emailCheck(response, email);
	}
	
	@PostMapping("/sendCerNum.do")
	public void sendCerNum(String email, HttpServletResponse response, HttpSession session) throws IOException {
		sService.sendCerNum(response, email);
		
	}
	
	@PostMapping("/s_signup3.do")
	public String userSignUpPost(String email, String password, String name, HttpServletResponse response) {
		System.out.println("user in");
		
		UsersVO u = new UsersVO();
		
		u.setUser_email(email);
		u.setUser_pw(password);
		u.setUser_name(name);
		
		int result = sService.userSignUp(u);
		
		if(result > 0) {
			System.out.println("회원가입 성공");
			return "signUp/s_signup3";
		}else {
			System.out.println("회원가입 실패");
			return "redirect:/login.do";
		}
		
	}
	
	@PostMapping("/f_signup3.do")
	public String farmerSignUpPost(String email, String password, String name, HttpServletResponse response) {
		System.out.println("farmer in");
		
		FarmersVO f = new FarmersVO();
		
		f.setFarmer_email(email);
		f.setFarmer_pw(password);
		f.setFarmer_name(name);
		
		int result = sService.farmerSignUp(f);
		
		if(result > 0) {
			System.out.println("회원가입 성공");
			return "signUp/f_signup3";
		}else {
			System.out.println("회원가입 실패");
			return "redirect:/login.do";
		}
		
	}
	
	/*
	 * @PostMapping("/s_signup3.do") public String userSignUpPost(UsersVO users) {
	 * System.out.println("in"); int result = sService.userSignUp(users);
	 * System.out.println(users.getUser_email());
	 * System.out.println(users.getUser_pw());
	 * System.out.println(users.getUser_name()); if(result > 0) {
	 * System.out.println("회원가입 성공"); }else { System.out.println("회원가입 실패"); return
	 * "redirect:/login.do"; } return "signUp/s_signup3"; }
	 */
}
