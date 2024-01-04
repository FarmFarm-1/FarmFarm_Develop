package com.farmfarm.controller.auth;

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
import com.farmfarm.model.auth.SignUpService;
import com.farmfarm.model.auth.TermOfUseService;
import com.farmfarm.model.etc.pwdSha256;

@Controller
public class SignUpController {

	@Autowired
	TermOfUseService tService;
	@Autowired
	SignUpService sService;
	
	@GetMapping(value = "/termContents", produces = "text/plain;charset=utf-8")
	public  @ResponseBody  String getTermContent(@RequestParam("termName")  String term_name, Model model) {
		TermsOfUseVO vo = tService.getTermContent(term_name);
		return vo.getTerm_content();
		
	}
	
	
	@GetMapping("/cerNumModal")
	public String cerNumModal() {
		return "signUp/validationModal";
	}
	
	
	@GetMapping("/s_signup1")
	public String showSSignup1() {
		return "signUp/s_signup1";
	}
	
	@GetMapping("/s_signup2")
	public String showSSignup2() {
		return "signUp/s_signup2";
	}
	
	
	@GetMapping("/f_signup1")
	public String showFSignUp1() {
		return "signUp/f_signup1";
	}
	
	@GetMapping("/f_signup2")
	public String showFSignUp2() {
		return "signUp/f_signup2";
	}
	
	@GetMapping("/f_signup3")
	public String showFSignUp3() {
		return "signUp/f_signup3";
	}
	
	@GetMapping("/signup_modal")
	public String showModal() {
		return "signUp/signupModal";
	}

	
	
	
	
	@PostMapping("/emailCheck")
	public void emailCheck(String email, HttpServletResponse response) throws IOException {
		sService.emailCheck(response, email);
	}
	
	@PostMapping("/sendCerNum")
	public void sendCerNum(String email, HttpServletResponse response, HttpSession session) throws IOException {
		sService.sendCerNum(response, email);
		
	}
	
	@PostMapping("/s_signup3")
	public String userSignUpPost(Model model,String email, String password, String name, HttpServletResponse response) {
		System.out.println("user in");
		
		UsersVO u = new UsersVO();
		
		u.setUser_email(email);
		
		String encrytPw = pwdSha256.encrypt(password);
		u.setUser_pw(encrytPw);
		u.setUser_name(name);
		
		int result = sService.userSignUp(u);
		
		if(result > 0) {
			model.addAttribute("signup_name",name);
			return "signUp/s_signup3";
		}else {
			return "redirect:/login";
		}
		
	}
	
	@PostMapping("/f_signup3")
	public String farmerSignUpPost(Model model,String email, String password, String name, HttpServletResponse response) {
		System.out.println("farmer in");
		
		FarmersVO f = new FarmersVO();
		
		f.setFarmer_email(email);
		
		String encrytPw = pwdSha256.encrypt(password);
		f.setFarmer_pw(encrytPw);
		f.setFarmer_name(name);
		
		int result = sService.farmerSignUp(f);
		
		if(result > 0) {
			model.addAttribute("signup_name",name);
			return "signUp/f_signup3";
		}else {
			return "redirect:/login";
		}
		
	}
	
	
}
