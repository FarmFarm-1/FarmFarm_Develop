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
import com.farmfarm.model.FarmersService;
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
	FarmersService farmerService;

	@Autowired
	jaehoService jhService;

	// ============================================================================================================
	// 유저
	@GetMapping("/a")
	public String base_supporter() {
		return "jaeho/menubar_supporter";
	}

	@GetMapping("/aa")
	public String passwdchangeForm() {
		return "jaeho/jaeho";
	}

	@ResponseBody
	@PostMapping("/passwdchange")
	public String passwdchange(HttpSession session, String originalPass, String newPasswd) throws Exception {
		String user_serial_num = (String) session.getAttribute("serial_num");
		String user_passwd = userService.pwCheck(user_serial_num);
		String encrytPw = pwdSha256.encrypt(originalPass);
		String message = "";
		
		System.out.println(originalPass);
		System.out.println(newPasswd);
		System.out.println(user_serial_num);
		System.out.println(user_passwd);

		if (user_passwd.equals(encrytPw)) {

			String encrytNewPw = pwdSha256.encrypt(newPasswd);
			// user_passwd = encrytNewPw;
			session.setAttribute("user_pw", encrytNewPw);
			userService.changePw(user_serial_num, encrytNewPw);
			message = "1";

		} else {
			message ="0";
		}
		System.out.println(message);
		return message;
	}

	@GetMapping("/depositList")
	public String showdepositList(Model model, HttpSession session) {
		String user_serial_num = (String) session.getAttribute("serial_num");
		List<Map<String, Object>> depositList = (List<Map<String, Object>>) jhService.depositList(user_serial_num);
		model.addAttribute("depositList", depositList);
		System.out.println(depositList);
		return "jaeho/depositList";
	}

	@GetMapping("/farmList")
	public String showfarmList(Model model, HttpSession session) {
		String user_serial_num = (String) session.getAttribute("serial_num");
		List<Map<String, Object>> farmList = (List<Map<String, Object>>) jhService.farmList(user_serial_num);
		model.addAttribute("farmList", farmList);
		return "jaeho/usedfarmmoney";
	}

	@PostMapping("/searchDate")
	public String showSearchDate(@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate,
			Model model, HttpSession session) {
		String user_serial_num = (String) session.getAttribute("serial_num");
		List<Map<String, Object>> showSearchDate = (List<Map<String, Object>>) jhService.showSearchDate(user_serial_num,
				startDate, endDate);
		model.addAttribute("showSearchDate", showSearchDate);
		return "jaeho/usedfarmmoney_Ajax";
	}

	// ============================================================================================================
	// 파머
	@GetMapping("/b")
	public String base_farmer() {
		return "jaeho/menubar_farmer";
	}

	@GetMapping("/bb")
	public String passwdchangeForm_farmer() {
		return "jaeho/jaeho_farmer";
	}

	@GetMapping("/depositList_farmer")
	public String showdepositList_farmer(Model model, HttpSession session) {
		String farmer_serial_num = (String) session.getAttribute("serial_num");
		List<Map<String, Object>> depositList = (List<Map<String, Object>>) jhService
				.depositList_farmer(farmer_serial_num);
		model.addAttribute("depositList", depositList);
		System.out.println(depositList);
		return "jaeho/depositList_farmer";
	}

	@ResponseBody
	@PostMapping(value = "/passwdchange_farmer", produces = "text/plain;charset=utf-8")
	public String passwdchange_farmer(String originalPass, String newPasswd, HttpSession session) throws Exception {
		String farmer_serial_num = (String) session.getAttribute("serial_num");
		String farmer_passwd = farmerService.pwCheck(farmer_serial_num);
		String encrytPw = pwdSha256.encrypt(originalPass);
		String message = "";

		System.out.println(originalPass);
		System.out.println(newPasswd);
		System.out.println(farmer_serial_num);
		System.out.println(farmer_passwd);

		if (farmer_passwd.equals(encrytPw)) {
			String encrytNewPw = pwdSha256.encrypt(newPasswd);
			farmerService.changePw(farmer_serial_num, encrytNewPw);
			message = "1";

		} else {
			message = "0";

		}
		System.out.println(message);
		return message;
	}
}