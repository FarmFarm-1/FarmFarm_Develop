package com.farmfarm.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmfarm.model.ChartService;
import com.farmfarm.model.ScheduledTasksService;

@Controller
public class MainController {

	@GetMapping("/")
	public String showmain(HttpSession session) {
		// session.setAttribute("serial_num", "us1010101010");
		// session.setAttribute("serial_num", "FA1010101010");
		session.removeAttribute("headerSelect");
		return "loginIndex";
	}

	@GetMapping("/login")
	public String showLogin() {
		return "login/login";
	}

	@GetMapping("/signup")
	public String showSignUpIndex() {
		return "signUp/signupIndex";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("serial_num");
		return "loginIndex";
	}

	/* 占쎈툡占쎌삋占쎈뮉 占쎈엘占쎈쐭占쎌뒠 筌띲끋釉⑨옙�뿯占쎈빍占쎈뼄. */
	// 筌롫뗄�뵥 占쎈읂占쎌뵠筌욑옙
	@GetMapping("/main")
	public String showMain(HttpSession session) {
		session.removeAttribute("headerSelect");
		return "loginIndex";
	}

	// 占쏙옙占쎈뎃 占쎈읂占쎌뵠筌욑옙
	@GetMapping("/funding")
	public String showFunding(HttpSession session) {
		session.setAttribute("headerSelect", "funding");
		return "/";
	}

	// 野껋럥�꼻 占쎈읂占쎌뵠筌욑옙
	@GetMapping("/auction")
	public String showAuction(HttpSession session) {
		session.setAttribute("headerSelect", "auction");
		return "/";
	}

	@GetMapping("/myPageFarmer")
	public String showMyFarmFarmer(HttpSession session) {
		session.setAttribute("headerSelect", "myFarm");
		session.removeAttribute("MyFarmer");
		return "myPage/Farmer/menubar_farmer";
	}

	// 筌잛럩占쏙옙釉� 占쎈읂占쎌뵠筌욑옙
	@GetMapping("/messageBox")
	public String showMessageBox(HttpSession session) {
		session.setAttribute("headerSelect", "myFarm");
		return "/";
	}

	// 筌띾뜆�뵠占쎈늄嚥≪뮇�젰占쎈뱜 占쎈읂占쎌뵠筌욑옙
	@GetMapping("/makeProject")
	public String showMakeProject(HttpSession session) {
		session.setAttribute("headerSelect", "myFarm");
		session.setAttribute("MyFarmer", "makeProject");
		return "myPage/Farmer/menubar_farmer";
	}

	@GetMapping("/regPro")
	public String regPro() {
		return "myPage/Farmer/regProduct";
	}

	// 占쎈７占쎌뵥占쎈뱜 �빊�뫗�읈 占쎈읂占쎌뵠筌욑옙
	@GetMapping("/chargePoints")
	public String showChargePoints(HttpSession session) {
		session.setAttribute("headerSelect", "myFarm");
		return "/";
	}

	// manually call crops-data-input method by hs
	@Autowired
	ScheduledTasksService scheduledTasksService;

	@GetMapping("/manuallyInputCropsData")
	@ResponseBody
	public String manuallyInputCropsData(String date) {
		scheduledTasksService.cropsQuoteDataFetchAndSaveOrNullSelf(date);
		return "call success";
	}
	
	@Autowired
	ChartService ChartService;
	
	@GetMapping("/cropsQuote")
	public String showCropsQuoteGraph(Model model) {
		String cropQuoteDate = ChartService.cropQuoteDate();
		List<Map<String, Object>> crops_quote_list = ChartService.cropQuoteList();
		List<String> cropsKindList = new ArrayList<>();
		List<String> cropsKindPriceList = new ArrayList<>();

		for(Map<String, Object> crop : crops_quote_list) {
		    String cropsKind = (String) crop.get("crops_kind");
		    String cropsKindPrice = (String) crop.get("crops_quote_list");
		    cropsKindList.add(cropsKind);
		    cropsKindPriceList.add(cropsKindPrice);
		}
		
		System.out.println(cropsKindList);
		
		model.addAttribute("cropQuoteDate",cropQuoteDate);
		model.addAttribute("cropsKindList",cropsKindList);
		model.addAttribute("cropsKindPriceList", cropsKindPriceList);
		
		return "cropsQuote_ajax";
	}

}
