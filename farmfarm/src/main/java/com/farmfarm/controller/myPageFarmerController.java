package com.farmfarm.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmfarm.dto.Farm_and_productVO;
import com.farmfarm.dto.Funding_reg_infoVO;
import com.farmfarm.model.FarmerNavCntService;
import com.farmfarm.model.FarmersService;
import com.farmfarm.model.S3Service;
import com.farmfarm.model.regProService;

@Controller
@RequestMapping("/myPageFarmer")
public class myPageFarmerController {
	
	@Autowired
	FarmersService fService;
	
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
	
	@GetMapping(value = "/regAuction")
	public String showRegAuction() {
		return "myPage/Farmer/regAuction";
	}
	
	@PostMapping(value = "/regAuction")
	@ResponseBody
	public String regAuction() {
		// 가져온 정보를 바탕으로 DB에 insert하기
		return "success";
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
	
	@GetMapping(value = "/account")
	public String showAccount() {
		return "myPage/Farmer/account";
	}
	
	@RequestMapping(value = "/regPro", method = RequestMethod.GET)
	public String showRegPro(HttpServletRequest request, HttpSession session) {
		return "myPage/Farmer/regProduct";
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
