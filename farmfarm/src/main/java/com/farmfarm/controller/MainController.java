package com.farmfarm.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmfarm.model.ScheduledTasksService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

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

	/* �븘�옒�뒗 �뿤�뜑�슜 留ㅽ븨�엯�땲�떎. */
	// 硫붿씤 �럹�씠吏�
	@GetMapping("/main")
	public String showMain(HttpSession session) {
		session.removeAttribute("headerSelect");
		return "loginIndex";
	}

	// ���뵫 �럹�씠吏�
	@GetMapping("/funding")
	public String showFunding(HttpSession session) {
		session.setAttribute("headerSelect", "funding");
		return "/";
	}

	// 寃쎈ℓ �럹�씠吏�
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

	@GetMapping("/myPageUser")
	public String showMyPageUser(HttpSession session) {
		session.setAttribute("headerSelect", "myFarm");
		return "myPage/user/menubar_supporter";
	}

	// 履쎌��븿 �럹�씠吏�
	@GetMapping("/messageBox")
	public String showMessageBox(HttpSession session) {
		session.setAttribute("headerSelect", "myFarm");
		return "/";
	}

	// 留덉씠�봽濡쒖젥�듃 �럹�씠吏�
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
	
	//manually call crops-data-input method by hs 
	@Autowired
	ScheduledTasksService scheduledTasksService;
	
	@GetMapping("/manuallyInputCropsData")
	@ResponseBody
	public String manuallyInputCropsData(String date) {
		scheduledTasksService.cropsQuoteDataFetchAndSaveOrNullSelf(date);
		return "call success";
	}
	Logger logger = LoggerFactory.getLogger(MainController.class);
	@GetMapping("/manuallySearchAccount")
	@ResponseBody
	public String manuallySearchAccount(HttpServletRequest request) {
		try {
			
			String token = "977e9fdab0ac841cf9a855d85dd02957a62c3ffd";
			URL url = new URL("https://api.iamport.kr/vbanks/holder?bank_code=004&bank_num=99454782054");
			
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestProperty("Authorization","Bearer " +token);
		    conn.setRequestProperty("Content-Type","application/json");
		    conn.setRequestMethod("GET");
		    logger.warn(url+"");
			logger.warn(Integer.toString(conn.getResponseCode()));
			BufferedReader rd;
			String line;
			StringBuilder sb = new StringBuilder();
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
			}
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}   
			rd.close();
			conn.disconnect();
			String result = sb.toString();
			logger.warn(result);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "call success";
	}
}
