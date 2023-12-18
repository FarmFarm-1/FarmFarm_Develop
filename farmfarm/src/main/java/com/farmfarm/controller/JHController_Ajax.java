package com.farmfarm.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmfarm.dto.User_cartVO;
import com.farmfarm.dto.UsersVO;
import com.farmfarm.model.UsersService;
import com.farmfarm.model.jaehoDAO;
import com.farmfarm.model.jaehoService;
import com.farmfarm.model.pwdSha256;

@Controller
@RequestMapping("/jaeho")
public class JHController_Ajax {
	
	@Autowired
	UsersService userService;
	
	@Autowired
	jaehoService jhService;

	@GetMapping("/aa")
	public String jaeho() {

		return "jaeho/jaeho";
	}

	
	  @GetMapping("/ab") 
	  public String jaeho2() {
	  
	  return "jaeho/usedfarmmoney"; }
	 

	@GetMapping("/a")
	public String base() {

		return "jaeho/jiwonmenubar";
	}

	@ResponseBody
	@PostMapping("/passwdchange")
	public void passwdchange(HttpSession session, String passwdCheck, String newPasswd, String newPasswdCheck) throws Exception {
        String user_serial_num = (String) session.getAttribute("serial_num");
        String user_passwd = (String) session.getAttribute("user_pw");
        String encrytPw = pwdSha256.encrypt(passwdCheck);

		
		System.out.println(passwdCheck);
		System.out.println(newPasswd);
		System.out.println(newPasswdCheck);
		System.out.println(user_serial_num);
		System.out.println(user_passwd);
		
	    if(session.getAttribute("serial_num") != null && session.getAttribute("user_pw") != null) {
	    	System.out.println("들어옴1");
	        if (user_passwd.equals(encrytPw)) {
	        	System.out.println("들어옴2");
	        	System.out.println(newPasswd +"     check    " +newPasswdCheck);
	            if (newPasswd.equals(newPasswdCheck)) {
	            	System.out.println("들어옴3");
                	String encrytNewPw = pwdSha256.encrypt(newPasswd);
                	//user_passwd = encrytNewPw;
                	session.setAttribute("user_pw", encrytNewPw);
                	userService.changePw(user_serial_num, encrytNewPw);
                	System.out.println("비밀번호 변경 성공");
	                
	            } else {
	                System.out.println("비밀번호 확인과 다름");
	            }
	        } else {
	            System.out.println("사용자 비밀번호 다름");
	        }
	    } else {
	        System.out.println("세션 값이 없음");
	    }
	}
	
	@GetMapping("/depositList")
	public String showdepositList(Model model, HttpSession session) {
		 String user_serial_num = (String) session.getAttribute("serial_num");
		 List<Map<String, Object>> depositList = (List<Map<String, Object>>) jhService.depositList(user_serial_num);
		 model.addAttribute("depositList",depositList);
		 System.out.println(depositList);
		 return "jaeho/depositList";
	}
	
	@GetMapping("/farmList")
	public String showfarmList(Model model, HttpSession session) {
		 String user_serial_num = (String) session.getAttribute("serial_num");
		 List<Map<String, Object>> farmList = (List<Map<String, Object>>) jhService.farmList(user_serial_num);
		 model.addAttribute("farmList",farmList);
		 return "jaeho/usedfarmmoney";
	}
	
	@PostMapping("/searchDate")
	public String showSearchDate(@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate, 
			                      Model model, HttpSession session ) {
		String user_serial_num = (String)session.getAttribute("serial_num");
		List<Map<String, Object>> showSearchDate = (List<Map<String, Object>>) jhService.showSearchDate(user_serial_num, startDate, endDate);
		model.addAttribute("showSearchDate",showSearchDate);
		return "jaeho/usedfarmmoney2";
	}
}