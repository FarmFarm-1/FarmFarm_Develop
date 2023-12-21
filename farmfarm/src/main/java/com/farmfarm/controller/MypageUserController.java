package com.farmfarm.controller;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmfarm.dto.MyPageUserAuctionVO;
import com.farmfarm.dto.MyPageUserCartFundingVO;
import com.farmfarm.dto.MyPageUserFundingVO;
import com.farmfarm.dto.User_account_historyVO;
import com.farmfarm.model.MyPageService;
import com.farmfarm.model.MyPageUserService;
import com.farmfarm.model.UserNavCntService;
import com.farmfarm.model.UsersService;
import com.farmfarm.model.pwdSha256;

@Controller
@RequestMapping("/myPageUser")
public class MypageUserController {

	@Autowired
	MyPageUserService service;

	@Autowired
	UserNavCntService UserNavCntService;

	@Autowired
	MyPageService myPageService;

	@Autowired
	UsersService userService;

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

	@GetMapping("/showMore")
	public String showMore() {
		return "myPage/user/showMore";
	}

	@GetMapping("/myFundingList")
	public String showMyFundingList(HttpSession session, Model model) {

		String user_serial_num = (String) session.getAttribute("serial_num"); // session占쎈퓠 占쏙옙占쎌삢占쎈쭆 user_serial_num
																				// 揶쏉옙占쎌죬占쎌궎疫뀐옙
		System.out.println(user_serial_num);

		List<MyPageUserFundingVO> myFundingList = service.myPageFundingList(user_serial_num); // 占쎄땀揶쏉옙 占쏙옙占쎈뎃占쎈립
																								// �뵳�딅뮞占쎈뱜
																								// 揶쏉옙占쎌죬占쎌궎疫뀐옙
		System.out.println(myFundingList);

		model.addAttribute("myFundingList", myFundingList);

		return "myPage/user/myFundingList";
	}

	@GetMapping("/myFundingListShowMore")
	public String showMyFundingListShowMore() {
		return "myPage/user/myFundingListShowMore";
	}

	@GetMapping("/myAuctionList")
	public String showMyAuctionList(HttpSession session, Model model) {

		String user_serial_num = (String) session.getAttribute("serial_num"); // session占쎈퓠 占쏙옙占쎌삢占쎈쭆 user_serial_num
																				// 揶쏉옙占쎌죬占쎌궎疫뀐옙
		System.out.println(user_serial_num);
		List<MyPageUserAuctionVO> myAuctionList = service.myPageAuctionList(user_serial_num); // 占쎄땀揶쏉옙 野껋럥�꼻占쎈립
																								// �뵳�딅뮞占쎈뱜
																								// 揶쏉옙占쎌죬占쎌궎疫뀐옙
		System.out.println(myAuctionList);
		model.addAttribute("myAuctionList", myAuctionList);
		return "myPage/user/myAuctionList";
	}

	@GetMapping("/myCartList")
	public String showMyCartList(HttpSession session, Model model) {
		String user_serial_num = (String) session.getAttribute("serial_num"); // session占쎈퓠 占쏙옙占쎌삢占쎈쭆 user_serial_num
																				// 揶쏉옙占쎌죬占쎌궎疫뀐옙
		System.out.println(user_serial_num);
		List<MyPageUserCartFundingVO> myCartFundingList = service.myPageCartFundingList(user_serial_num); // 占쎄땀揶쏉옙
																											// 筌≪뮉釉�
																											// 占쏙옙占쎈뎃
																											// �뵳�딅뮞占쎈뱜
																											// 揶쏉옙占쎌죬占쎌궎疫뀐옙
		System.out.println(myCartFundingList);
		model.addAttribute("myCartFundingList", myCartFundingList);
		return "myPage/user/myCartList";
	}
	
	@GetMapping("/chatting")
	public String Chatting() {
		return "myPage/user/JHMESSAGE";
	}

	

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

	@GetMapping("/accountRegister")
	public String accountRegister(HttpSession session, Model model) {
		if (((String) session.getAttribute("serial_num")).substring(0, 2).equals("us")) {
			HashMap<String, Object> data = myPageService.accountExistence(session);
			String account_holder = (String) data.get("account_holder");
			User_account_historyVO vo = (User_account_historyVO) data.get("account_info");
			if (vo != null) {
				model.addAttribute("account_holder", account_holder);
				model.addAttribute("account_bank", vo.getUser_bank());
				model.addAttribute("account_num", vo.getUser_account());
				;
				return "myPage/accountShow";
			} else {
				return "myPage/accountRegister";
			}
		}
		return "/";

	}

	@PostMapping("/verifyAndRegAccount")
	@ResponseBody
	public String verifyAndRegAccount(@RequestParam HashMap<String, String> data, HttpSession session) {
		String returnMessage = myPageService.verifyAndRegAccount(data, session);
		logger.warn(returnMessage);
		if (returnMessage.equals("AccountRegisterSuccess")) {
			return "success";
		} else {
			return "fail";
		}
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
	public String passwdchange(HttpSession session,String originalPass, String newPasswd) throws Exception { 
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
				  message ="0"; } 
			System.out.println(message); 
			return message; 
			}
	// 재호
}
