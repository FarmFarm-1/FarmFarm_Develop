package com.farmfarm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmfarm.model.auction.ChartService;
import com.farmfarm.model.etc.ScheduledTasksService;

@Controller
public class MainController {
	
	Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@GetMapping("/")
	public String showmain(HttpSession session) {
		session.removeAttribute("headerSelect");
		return "loginIndex";
	}
	
	@GetMapping("/login")
	public String showLogin(HttpSession session) {
		session.setAttribute("headerSelect","login");
		return "login/login";
	}

	@GetMapping("/signup")
	public String showSignUpIndex(HttpSession session) {
		session.setAttribute("headerSelect","signup");
		return "signUp/signupIndex";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/myPageFarmer", method = {RequestMethod.GET, RequestMethod.POST})
	public String showMyFarmFarmer(HttpSession session, Model model, @RequestParam(name = "path", required = false) String path) {
		session.setAttribute("headerSelect", "myFarm");
		if(path != null) {
			model.addAttribute("path", path);
		}

		String serial_num = (String) session.getAttribute("serial_num");
		if(serial_num == null || serial_num.substring(0, 2).equals("us")) {
			return "redirect:/login";
		}
		return "myPage/Farmer/menubar_farmer";
	}
	
	@RequestMapping(value = "/myPageUser", method = {RequestMethod.GET, RequestMethod.POST})
	public String showMyPageUser(HttpSession session, Model model, @RequestParam(name = "path", required = false) String path,
			@RequestParam(name = "farmernum", required = false)String farmernum) {
		session.setAttribute("headerSelect", "myFarm");
		model.addAttribute("check", "null");
		if(path != null) {
			model.addAttribute("path", path);
		}
		if(farmernum != null) {
			model.addAttribute("farmernum",farmernum);
		}
		
		String serial_num = (String) session.getAttribute("serial_num");
		if(serial_num == null || serial_num.substring(0, 2).equals("FA")) {
			return "redirect:/login";
		}
		return "myPage/user/menubar_supporter";
	}


	@GetMapping("/messageBox")
	public String showMessageBox(HttpSession session) {
		session.setAttribute("headerSelect", "myFarm");
		return "/";
	}

	
	@GetMapping("/makeProject")
	public String showMakeProject(HttpSession session) {
		session.setAttribute("headerSelect", "myFarm");
		return "myPage/Farmer/menubar_farmer";
	}

	@GetMapping("/chargePoints")
	public String showChargePoints(HttpSession session, Model model) {
		session.setAttribute("headerSelect", "myFarm");
		model.addAttribute("check", "point");
		return "myPage/user/menubar_supporter";
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
	
	@GetMapping("checkUserLoginStatus")
	@ResponseBody
	public Map<String, Boolean> checkUserLoginStatus(HttpSession session) {
		HashMap<String, Boolean> data = new HashMap<>();
		String serial_num = (String) session.getAttribute("serial_num");
		if(serial_num == null || serial_num.substring(0, 2).equals("FA")) {
			data.put("loginStatus", false);
		} else {
			data.put("loginStatus", true);
		}
		return data;
	}
	
	@GetMapping("checkFarmerLoginStatus")
	@ResponseBody
	public Map<String, Boolean> checkFarmerLoginStatus(HttpSession session) {
		HashMap<String, Boolean> data = new HashMap<>();
		String serial_num = (String) session.getAttribute("serial_num");
		if(serial_num == null || serial_num.substring(0, 2).equals("us")) {
			data.put("loginStatus", false);
		} else {
			data.put("loginStatus", true);
		}
		return data;
	}

}
