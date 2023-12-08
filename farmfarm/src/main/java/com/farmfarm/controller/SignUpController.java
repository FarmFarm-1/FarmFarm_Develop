package com.farmfarm.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@GetMapping(value = "/termContent.do", produces = "text/plain;charset=utf-8")
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

}
