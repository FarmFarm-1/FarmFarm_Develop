package com.farmfarm.controller.mypage;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmfarm.dto.Auction_reg_infoVO;
import com.farmfarm.dto.Cultivating_product_detailVO;
import com.farmfarm.dto.Farm_and_productVO;
import com.farmfarm.dto.Funding_reg_infoVO;
import com.farmfarm.model.ChattingService;
import com.farmfarm.model.MyPageService;
import com.farmfarm.model.DepositService;
import com.farmfarm.model.etc.S3Service;
import com.farmfarm.model.etc.pwdSha256;
import com.farmfarm.model.farmer.FarmerNavCntService;
import com.farmfarm.model.farmer.FarmersService;
import com.farmfarm.model.farmer.MyPageFarmerService;
import com.farmfarm.model.farmer.UpdateCulService;
import com.farmfarm.model.farmer.regProService;
import com.farmfarm.model.user.UsersService;


@Controller
@RequestMapping("/myPageFarmer")
public class myPageFarmerController {
	@Autowired
	UsersService usersService;
	
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
	
	@Autowired
	DepositService jhService;
	
	@Autowired
	MyPageFarmerService myPageFarmerService;
	
	@Autowired
	UpdateCulService ucService;
	
	@Autowired
	ChattingService chattingService;
	
	@GetMapping(value = "/navBarCnt")
	@ResponseBody
	public HashMap<String,Object> navBarCnt(HttpSession session) {
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		String farmer = (String) session.getAttribute("serial_num");
		map = cService.getCnt(farmer);
		
		return map;
	}
	
	@PostMapping(value = "/showUpdateCultivate")
	public String showUpdate(Model model, @RequestBody Map<String,Object> param) {
		// post 처리 해야할듯 함
		
		String product_serial_num = (String) param.get("product_serial_num");
	    String product_name = (String) param.get("product_name");
	    String farm_name = (String) param.get("farm_name");
	    String farm_address = (String) param.get("farm_address");
	    String imgurl = (String) param.get("imgurl");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("funding_thumb_img_url", imgurl);
		map.put("product_serial_num", product_serial_num);
		map.put("product_name", product_name);
		map.put("farm_name", farm_name);
		map.put("farm_address", farm_address);
		
		model.addAttribute("map", map);

		
		return "myPage/Farmer/updateCultivate";
	}
	
	@PostMapping(value = "/updateCultivate")
	@ResponseBody
	public String updateCultivate(@RequestBody Map<String,Object> param, Cultivating_product_detailVO vo) {
		
		String fa = String.valueOf(param.get("fertilizer_amount"));
		System.out.println(fa);
		Integer fertilizer_amount;
		if(fa.equals("")) {
			fertilizer_amount = null;
		}else {
			fertilizer_amount = Integer.parseInt(fa);
		}
		
		String product_serial_num = (String) param.get("product_serial_num");
	    String cultivate_status = (String) param.get("cultivate_status");
	    String cultivating_content = (String) param.get("cultivating_content");
	    String cultivating_image = (String) param.get("cultivating_image");
	    String fertilizer_content = (String) param.get("fertilizer_content");
	    String etc_content = (String) param.get("etc_content");
	    
	    vo.setProduct_serial_num(product_serial_num);
	    vo.setCultivate_status(cultivate_status);
	    vo.setCultivating_content(cultivating_content);
	    vo.setCultivating_image(cultivating_image);
	    vo.setFertilizer_content(fertilizer_content);
	    vo.setFertilizer_amount(fertilizer_amount);
	    vo.setEtc_content(etc_content);
	    
	    int res = ucService.updateCultivate(vo);
	    
	    if (res>0) {
	    	return "success";
	    }else {
	    	return "fail";
	    }
	    
	    
	}
	

	@GetMapping(value = "/myProject")
	public String showMyProject(HttpSession session, Model model) {
		String farmer_serial_num = (String)session.getAttribute("serial_num");
		List<Map<String, Object>> projectList = (List<Map<String, Object>>) myPageFarmerService.selectProjectList(farmer_serial_num);
		int hasAuctionWaiting = 0;
		
		for (Map<String, Object> map : projectList) {
			if (map.get("funding_pct") == null) {
				map.put("funding_pct", 0);
			}
			if(map.get("auction_thumb_img_url") == null) {
				String funding_thumb_img_url = (String)map.get("funding_thumb_img_url");
				map.put("auction_thumb_img_url", funding_thumb_img_url);
			}
			if(map.get("max_price")==null) {
				map.put("max_price", '-');
			} 
			if (map.get("product_status") != null && map.get("product_status").equals("경매대기중")) {
		        hasAuctionWaiting = 1;
		        model.addAttribute("hasAuctionWaiting", hasAuctionWaiting);
		    }
			
			
		}
		model.addAttribute("projectList", projectList);
		
		return "myPage/Farmer/myProject";
	}
	
	@PostMapping(value = "/showRegAuction")
	   public String showRegAuction(Model model, @RequestBody Map<String,Object> param) {
	      // post 처리 해야할듯 함 
	      Map<String, Object> map = new HashMap<String, Object>();
	      
	      String product_serial_num = (String) param.get("product_serial_num");
	      String product_name = (String) param.get("product_name");
	      String farm_name = (String) param.get("farm_name");
	      String farm_address = (String) param.get("farm_address");
	      String imgurl = (String) param.get("imgurl");
	    
	      
	      map.put("funding_thumb_img_url", imgurl);
		  map.put("product_serial_num", product_serial_num);
		  map.put("product_name", product_name);
		  map.put("farm_name", farm_name);
		  map.put("farm_address",farm_address );
			
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
	public String showProfitShare(Model model, HttpSession session) {
		String farmer_serial_num = (String) session.getAttribute("serial_num");
		List<Map<String, Object>> depositList = (List<Map<String, Object>>) jhService.depositList_farmer(farmer_serial_num);
		model.addAttribute("depositList", depositList);
		System.out.println(depositList);
		return "myPage/Farmer/profitShare";
	}
	
	@GetMapping(value = "/changePassword")
	public String changePassword() {
		return "myPage/Farmer/changePassword";
	}
	
	@ResponseBody
	@PostMapping(value = "/passwdchange_farmer", produces = "text/plain;charset=utf-8")
	public String passwdchange_farmer(String originalPass, String newPasswd, HttpSession session) throws Exception {
		String farmer_serial_num = (String) session.getAttribute("serial_num");
		String farmer_passwd = fService.pwCheck(farmer_serial_num);
		String encrytPw = pwdSha256.encrypt(originalPass);
		String message = "";

		System.out.println(originalPass);
		System.out.println(newPasswd);
		System.out.println(farmer_serial_num);
		System.out.println(farmer_passwd);

		if (farmer_passwd.equals(encrytPw)) {
			String encrytNewPw = pwdSha256.encrypt(newPasswd);
			fService.changePw(farmer_serial_num, encrytNewPw);
			message = "1";

		} else {
			message = "0";

		}
		System.out.println(message);
		return message;
	}
	//재호
	
	//재호	
	@RequestMapping(value = "/chatting", method = {RequestMethod.POST })
	public String chatting(HttpServletRequest req, HttpServletResponse resp, HttpSession session, Model model,
			@RequestParam(name = "chatusernum", required = false) String chatusernum) {
		String farmer_serial_num = (String) session.getAttribute("serial_num");
		String farmername = fService.findName(farmer_serial_num);

		// 채팅방 생성 또는 찾기
		Map<String, Object> roomParam = new HashMap<>();
		roomParam.put("chat_user", chatusernum);
		roomParam.put("chat_farmer", farmer_serial_num);
		System.out.println("chat_farmer입니다ㅏㅏㅏㅏㅏ");

		Integer checkRoomResult = chattingService.checkroom(roomParam);
		int chkroom_id = checkRoomResult;
		roomParam.put("chat_room_id", chkroom_id);
		
		//메시지 읽음 체크를 위한 map 선언
		Map<String, Object> map_farmer = new HashMap<>();
		map_farmer.put("room_id",chkroom_id);
		map_farmer.put("sender", chatusernum);
		
		//만약 유저가 로그인 했으면 파머의 메시지를 읽음처리하는 update문
		chattingService.updateRead(map_farmer);
		
		
		List<Map<String, Object>>chkroom_idList = chattingService.checkroomFarmer(farmer_serial_num);
		List<Map<String, Object>> chatHistory = (List<Map<String, Object>>)chattingService.chatting_history(chkroom_id);
		
		JSONArray jsonArr = new JSONArray();
		for (Map<String, Object> map : chatHistory) {
		    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		    Object sentdateObj = map.get("sentdate");
		    String dateString = null;
		    if (sentdateObj instanceof Date) {
		        dateString = format.format((Date) sentdateObj);
		    } else if (sentdateObj instanceof String) {
		        dateString = (String) sentdateObj;
		    }
		    map.put("sentdate", dateString);

		    Object messagetimeObj = map.get("messagetime");
		    String messagetime = null;
		    if (messagetimeObj instanceof String) {
		        messagetime = (String) messagetimeObj;
		        if (messagetime.startsWith("AM")) {
		            messagetime = "오전" + messagetime.substring(2);
		        } else if (messagetime.startsWith("PM")) {
		            messagetime = "오후" + messagetime.substring(2);
		        }
		    }
		    map.put("messagetime", messagetime);

		    JSONObject json = new JSONObject(map);
		    jsonArr.add(json);
		}
		
		String username = usersService.findName(chatusernum);
		model.addAttribute("chkroom_idList",chkroom_idList);
		model.addAttribute("chkroom_id", chkroom_id);
		model.addAttribute("farmer_serial_num", farmer_serial_num);
		model.addAttribute("user_serial_num", chatusernum);
		model.addAttribute("username", username);
		model.addAttribute("chatHistory",chatHistory);
		model.addAttribute("jsonArr",jsonArr);
		model.addAttribute("farmer_name",farmername);
		return "myPage/Farmer/chat";
	}
	
	@RequestMapping(value = "/showChat", method = {RequestMethod.GET })
	public String showChatting(HttpServletRequest req, HttpServletResponse resp, HttpSession session, Model model){
		String farmer_serial_num = (String) session.getAttribute("serial_num");
		String farmername = fService.findName(farmer_serial_num);
		
		List<Map<String, Object>>chkroom_idList = chattingService.checkroomFarmer(farmer_serial_num);
		System.out.println("chkroomLIST = "+chkroom_idList);
		
		model.addAttribute("chkroom_idList",chkroom_idList);
		model.addAttribute("farmername",farmername);
		model.addAttribute("farmer_serial_num",farmer_serial_num);
		return "myPage/Farmer/chatShow";
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
	
	@ResponseBody
	@PostMapping("/checkFarmerAccount")
	public String checkFarmerAccount(HttpSession session) {
		int result = myPageService.checkAccountForRegisterProduct(session);
		if(result == 1) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	
	
}
