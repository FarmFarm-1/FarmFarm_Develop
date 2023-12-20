package com.farmfarm.controller;

import java.util.HashMap;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.ResponseBody;


import com.farmfarm.dto.Farmer_account_historyVO;
import com.farmfarm.dto.User_account_historyVO;
import com.farmfarm.dto.Auction_reg_infoVO;
import com.farmfarm.dto.Farm_and_productVO;
import com.farmfarm.dto.Funding_reg_infoVO;
import com.farmfarm.model.FarmerNavCntService;

import com.farmfarm.model.FarmersService;

import com.farmfarm.model.MyPageService;

import com.farmfarm.model.S3Service;
import com.farmfarm.model.regProService;


@Controller
@RequestMapping("/myPageFarmer")
public class myPageFarmerController {
	
	@Autowired
	FarmersService fService;
	
	@Autowired
	MyPageService myPageService;
	
	Logger logger = LoggerFactory.getLogger(myPageFarmerController.class);
	
	@Autowired
	S3Service S3Service;
	
	@Autowired
	regProService rService;
	
	@Autowired
	FarmerNavCntService cService;
	
	@GetMapping(value = "/navBarCnt")
	@ResponseBody
	public HashMap<String,Object> navBarCnt(HttpSession session) {
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		String farmer = (String) session.getAttribute("serial_num");
		map = cService.getCnt(farmer);
		
		return map;
	}
	
	@GetMapping(value = "/showUpdateCultivate")
	public String showUpdate(Model model) {
		// post 처리 해야할듯 함
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("funding_thumb_img_url", "https://farmfarmimagess.s3.ap-northeast-2.amazonaws.com/%ED%99%94%EB%A9%B4%20%EC%BA%A1%EC%B2%98%202023-11-21%20135506.png");
		map.put("product_serial_num", "PR2023121800001");
		map.put("product_name", "보리보리쌀보리");
		map.put("farm_name", "보현농장");
		map.put("farm_address", "충북 괴산군 청천면 문장로 116-3");
		
		model.addAttribute("map", map);

		
		return "myPage/Farmer/updateCultivate";
	}
	
	@PostMapping(value = "/updateCultivate")
	@ResponseBody
	public String updateCultivate() {
		// 가져온 정보를 바탕으로 DB에 insert하기
		return "success";
	}
	
	@GetMapping(value = "/showRegAuction")
	public String showRegAuction(Model model) {
		// post 처리 해야할듯 함 
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("funding_thumb_img_url", "https://farmfarmimagess.s3.ap-northeast-2.amazonaws.com/%ED%99%94%EB%A9%B4%20%EC%BA%A1%EC%B2%98%202023-11-21%20135506.png");
		map.put("product_serial_num", "PR2023121800001");
		map.put("product_name", "보리보리쌀보리");
		map.put("farm_name", "보현농장");
		map.put("farm_address", "충북 괴산군 청천면 문장로 116-3");
		
		model.addAttribute("map", map);
		
		
		return "myPage/Farmer/regAuction";
	}
	
	@RequestMapping(value = "/regAuction", method = RequestMethod.POST)
	@ResponseBody
	public String regAuction(HttpServletRequest request, HttpSession session, 
			@RequestBody Map<String,Object> param,  Farm_and_productVO vo, Auction_reg_infoVO aucVO) throws ParseException {
		// 가져온 정보를 바탕으로 DB에 insert하기
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date parsed = format.parse((String) param.get("auction_deadline"));
		java.sql.Date auction_deadline = new java.sql.Date(parsed.getTime());
		
		String status = "경매중";
		
		aucVO.setAuction_deadline(auction_deadline);
		aucVO.setHarvest_amount(Integer.parseInt(String.valueOf(param.get("harvest_amount"))));
		aucVO.setProduct_serial_num((String) param.get("product_serial_num"));
		aucVO.setStarting_price(Integer.parseInt(String.valueOf(param.get("starting_price"))));
		
		vo.setProduct_serial_num((String) param.get("product_serial_num"));
		vo.setProduct_status(status);
		vo.setAuction_thumb_img_url((String) param.get("auction_thumb_img_url"));
		vo.setAuction_product_img_url((String) param.get("auction_product_img_url"));
		
		int res = rService.regAuc(vo, aucVO);
		
		if(res>0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	
	
	
	@GetMapping(value = "/profitShare")
	public String showProfitShare() {
		return "myPage/Farmer/profitShare";
	}
	
	@GetMapping(value = "/changePassword")
	public String changePassword() {
		return "myPage/Farmer/changePassword";
	}
	
	@GetMapping(value = "/chat")
	public String showChat() {
		return "myPage/Farmer/chat";
	}
	
	@RequestMapping(value = "/regPro", method = RequestMethod.GET)
	public String showRegPro(HttpServletRequest request, HttpSession session) {
		return "myPage/Farmer/regProduct";
	}
	
	@GetMapping("/accountRegister")
	public String accountRegister(HttpSession session, Model model) {
		if(((String)session.getAttribute("serial_num")).substring(0,2).equals("FA")) {
			HashMap<String, Object> data = myPageService.accountExistence(session);
			String account_holder = (String)data.get("account_holder");
			Farmer_account_historyVO vo = (Farmer_account_historyVO)data.get("account_info");
			if(vo != null) {
				model.addAttribute("account_holder", account_holder);
				model.addAttribute("account_bank",vo.getFarmer_bank());
				model.addAttribute("account_num", vo.getFarmer_account());
				return "myPage/accountShow";
			} else {
				return "myPage/accountRegister";
			}
		} else {
			return "/";
		}
	}
	
	@PostMapping("/verifyAndRegAccount")
	@ResponseBody
	public String verifyAndRegAccount(@RequestParam HashMap<String, String> data, HttpSession session) {
		String returnMessage = myPageService.verifyAndRegAccount(data, session);
		logger.warn(returnMessage);
		if(returnMessage.equals("AccountRegisterSuccess")) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@RequestMapping(value = "/regProduct", method = RequestMethod.POST)
	@ResponseBody
	public String regPro(HttpServletRequest request, HttpSession session, 
			@RequestBody Map<String,Object> param,  Farm_and_productVO vo, Funding_reg_infoVO fundVO) throws ParseException {
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date parsed = format.parse((String) param.get("expected_planting_date"));
		java.sql.Date expected_planting_date = new java.sql.Date(parsed.getTime());
		
		java.util.Date parsed2 = format.parse((String) param.get("expected_harvest_date"));
		java.sql.Date expected_harvest_date = new java.sql.Date(parsed2.getTime());
		
		java.util.Date parsed3 = format.parse((String) param.get("funding_deadline"));
		java.sql.Date funding_deadline = new java.sql.Date(parsed3.getTime());
		
		
		
		// real register Logic
		String serial_num = (String) session.getAttribute("serial_num");
		vo.setFarmer_serial_num(serial_num);
		vo.setProduct_kind((String) param.get("product_kind"));
		vo.setProduct_name((String) param.get("product_name"));
		vo.setFarmer_phone((String) param.get("farmer_phone"));
		vo.setFarm_name((String) param.get("farm_name"));
		vo.setFarm_address((String) param.get("farm_address"));
		vo.setFarm_introduction((String) param.get("farm_introduction"));
		vo.setFarm_square_footage(Integer.parseInt(String.valueOf(param.get("farm_square_footage"))));
		vo.setExpected_planting_date(expected_planting_date);
		vo.setExpected_harvest_date(expected_harvest_date);
		
		vo.setFunding_thumb_img_url((String) param.get("funding_thumb_img_url"));
		vo.setFunding_product_img_url((String) param.get("funding_product_img_url"));
		
		fundVO.setTarget_total_amount(Integer.parseInt(String.valueOf(param.get("target_total_amount"))));
		fundVO.setFunding_deadline(funding_deadline);
		
		int res = rService.regPro(vo, fundVO);
		
		if(res>0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	
	
}
