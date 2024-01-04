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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmfarm.dto.MyPageUserAuctionVO;
import com.farmfarm.dto.MyPageUserCartVO;
import com.farmfarm.dto.MyPageUserFundingDetailVO;
import com.farmfarm.dto.MyPageUserFundingVO;
import com.farmfarm.model.ChattingService;
import com.farmfarm.model.MyPageService;
import com.farmfarm.model.auth.CertService;
import com.farmfarm.model.etc.pwdSha256;
import com.farmfarm.model.farmer.FarmersService;
import com.farmfarm.model.user.MyPageUserService;
import com.farmfarm.model.user.UserNavCntService;
import com.farmfarm.model.user.UsersService;

@Controller
@RequestMapping("/myPageUser")
public class MypageUserController {

	@Autowired
	CertService certService;

	@Autowired
	MyPageUserService service;

	@Autowired
	UserNavCntService UserNavCntService;

	@Autowired
	MyPageService myPageService;

	@Autowired
	UsersService userService;

	@Autowired
	ChattingService chattingService;
	
	@Autowired
	FarmersService farmersService;

	Logger logger = LoggerFactory.getLogger(MypageUserController.class);

	@GetMapping(value = "/navBarCnt")
	@ResponseBody
	public HashMap<String, Object> navBarCnt(HttpSession session) {

		HashMap<String, Object> map = new HashMap<String, Object>();

		String user_serial_num = (String) session.getAttribute("serial_num");
		map = UserNavCntService.getUserInfo(user_serial_num);
		System.out.println(map);
		return map;
	}
	
	
	//재호	
	@RequestMapping(value = "/chatting", method = {RequestMethod.POST })
	public String insertANDshowchatting(HttpServletRequest req, HttpServletResponse resp, HttpSession session, Model model,
			@RequestParam(name = "chatfarmernum", required = false) String chatfarmernum) {
		String user_serial_num = (String) session.getAttribute("serial_num");
		String username = userService.findName(user_serial_num);

		// 채팅방 생성 또는 찾기
		Map<String, Object> roomParam = new HashMap<>();
		roomParam.put("chat_user", user_serial_num);
		roomParam.put("chat_farmer", chatfarmernum);

		// 동일한 user_serial_num과 chatfarmernum의 채팅방이 이미 있는지 확인
		Integer checkRoomResult = chattingService.checkroom(roomParam);
		int chkroom_id;
		if (checkRoomResult == -1) {
			// 존재하지 않는 경우 채팅방 생성
			chattingService.insertChatRoom(roomParam);
			chkroom_id = chattingService.checkroom(roomParam);
		} else {
			// 존재하는 경우, 채팅방 번호를 roomParam에 추가
			chkroom_id = checkRoomResult;
			roomParam.put("chat_room_id", chkroom_id);
		}
		//메시지 읽음 체크를 위한 map 선언
		Map<String, Object> map_user = new HashMap<>();
		map_user.put("room_id",chkroom_id);
		map_user.put("sender", chatfarmernum);
		
		//만약 유저가 로그인 했으면 파머의 메시지를 읽음처리하는 update문
		chattingService.updateRead(map_user);
		
		List<Map<String, Object>>chkroom_idList = chattingService.checkroomUser(user_serial_num);
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


		String farmer_name = farmersService.findName(chatfarmernum);
		model.addAttribute("chkroom_idList",chkroom_idList);
		model.addAttribute("chkroom_id", chkroom_id);
		model.addAttribute("farmer_serial_num", chatfarmernum);
		model.addAttribute("user_serial_num", user_serial_num);
		model.addAttribute("username", username);
		model.addAttribute("chatHistory",chatHistory);
		model.addAttribute("jsonArr",jsonArr);
		model.addAttribute("farmer_name",farmer_name);

		return "myPage/user/userChatting";
	}
	
	@RequestMapping(value = "/showChatting", method = {RequestMethod.GET })
	public String showChatting(HttpServletRequest req, HttpServletResponse resp, HttpSession session, Model model){

		String user_serial_num = (String) session.getAttribute("serial_num");
		String username = userService.findName(user_serial_num);
		
		List<Map<String, Object>>chkroom_idList = chattingService.checkroomUser(user_serial_num);	
		model.addAttribute("chkroom_idList",chkroom_idList);
		model.addAttribute("username",username);
		model.addAttribute("user_serial_num",user_serial_num);
		return "myPage/user/userChattingShow";
	}
	
	//재호

	@GetMapping("/farmMoneyCharge")
	public String showChargePoints() {
		return "myPage/user/farmMoneyCharge";
	}

	@PostMapping("/farmMoneyChargeCallAPI")
	@ResponseBody
	public HashMap<String, String> farmMoneyChargeCallAPI(Model model, HttpSession session) {
		HashMap<String, String> data = myPageService.farmMoneyChargeCallAPI(session);
		return data;
	}

	// 재호
	@GetMapping("/usedfarmList")
	public String showfarmList(Model model, HttpSession session) {
		String user_serial_num = (String) session.getAttribute("serial_num");
		List<Map<String, Object>> farmList = (List<Map<String, Object>>) service.usedfarmList(user_serial_num);
		model.addAttribute("farmList", farmList);
		return "myPage/user/usedfarmmoney";
	}

	@PostMapping("/searchDate")
	public String showSearchDate(@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate,
			Model model, HttpSession session) {
		String user_serial_num = (String) session.getAttribute("serial_num");
		List<Map<String, Object>> showSearchDate = (List<Map<String, Object>>) service.showSearchDate(user_serial_num,
				startDate, endDate);
		model.addAttribute("showSearchDate", showSearchDate);
		return "myPage/user/usedfarmmoney_Ajax";
	}

	@GetMapping("/depositList")
	public String showdepositList(Model model, HttpSession session) {
		String user_serial_num = (String) session.getAttribute("serial_num");
		List<Map<String, Object>> depositList = (List<Map<String, Object>>) service.depositList(user_serial_num);
		model.addAttribute("depositList", depositList);
		System.out.println(depositList);
		return "myPage/user/depositList";
	}

	@GetMapping("/InputPW")
	public String passwdchangeForm() {
		return "myPage/user/checkANDchange";
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
			session.setAttribute("user_pw", encrytNewPw);
			userService.changePw(user_serial_num, encrytNewPw);
			message = "1";
		} else {
			message = "0";
		}
		System.out.println(message);
		return message;
	}
	// 재호

	@GetMapping("/myFundingList")
	public String showMyFundingList(HttpSession session, Model model) {

		String user_serial_num = (String) session.getAttribute("serial_num"); // session에 저장된 user_serial_num 가져오기
		System.out.println(user_serial_num);

		List<MyPageUserFundingVO> myFundingList = service.myPageFundingList(user_serial_num); // 내가 펀딩한 리스트 가져오기
		System.out.println(myFundingList);

		model.addAttribute("myFundingList", myFundingList);

		return "myPage/user/myFundingList";
	}

	@PostMapping("/myFundingListShowMore")
	public String showMyFundingListShowMore(String product_serial_num, Model model) {
		System.out.println(product_serial_num);
		List<MyPageUserFundingDetailVO> fundingDetail = service.myPageFundingListDetail(product_serial_num);
		System.out.println(fundingDetail);
		model.addAttribute("fundingDetail", fundingDetail);
		model.addAttribute("product_serial_num", product_serial_num);
		if (fundingDetail.size() != 0) {
			model.addAttribute("status", fundingDetail.get(0).getCultivate_status());
		}

		return "myPage/user/myFundingListShowMore";
	}

	@GetMapping("/myAuctionList")
	public String showMyAuctionList(HttpSession session, Model model) {

		String user_serial_num = (String) session.getAttribute("serial_num"); // session에 저장된 user_serial_num 가져오기
		System.out.println(user_serial_num);
		List<MyPageUserAuctionVO> myAuctionList = service.myPageAuctionList(user_serial_num); // 내가 경매한 리스트 가져오기
		System.out.println(myAuctionList);
		model.addAttribute("myAuctionList", myAuctionList);

		return "myPage/user/myAuctionList";
	}

	@GetMapping("/myCartList")
	public String showMyCartList(HttpSession session, Model model) {
		String user_serial_num = (String) session.getAttribute("serial_num"); // session에 저장된 user_serial_num 가져오기
		System.out.println(user_serial_num);
		List<MyPageUserCartVO> myCartFundingList = service.myPageCartFundingList(user_serial_num); // 내가 찜한 펀딩 리스트 모두
																									// 가져오기
		System.out.println(myCartFundingList);
		model.addAttribute("myCartFundingList", myCartFundingList);

		return "myPage/user/myCartList";
	}

	@GetMapping("/myCartFundingList")
	public String showMyCartFundingList(HttpSession session, Model model) {
		String user_serial_num = (String) session.getAttribute("serial_num"); // session에 저장된 user_serial_num 가져오기
		System.out.println(user_serial_num);
		List<MyPageUserCartVO> myCartFundingList = service.myPageCartFundingList(user_serial_num); // 내가 찜한 펀딩 리스트 모두
																									// 가져오기
		System.out.println(myCartFundingList);
		model.addAttribute("myCartFundingList", myCartFundingList);

		return "myPage/user/myCartFundingList";
	}

	@GetMapping("/myCartAuctionList")
	public String showMyCartAuctionList(HttpSession session, Model model) {
		String user_serial_num = (String) session.getAttribute("serial_num"); // session에 저장된 user_serial_num 가져오기
		System.out.println(user_serial_num);
		List<MyPageUserCartVO> myCartAuctionList = service.myPageCartAuctionList(user_serial_num); // 내가 찜한 경매 리스트 모두
																									// 가져오기
		System.out.println(myCartAuctionList);
		model.addAttribute("myCartAuctionList", myCartAuctionList);

		return "myPage/user/myCartAuctionList";
	}

	@PostMapping("/cert")
	@RequestMapping(value = "/cert", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String cert(@RequestParam("imp_uid") String uid, HttpServletResponse resp) {
		String result = certService.cert(uid);
		System.out.println(result);
		resp.setCharacterEncoding("UTF-8");
		return result;
	}

}
