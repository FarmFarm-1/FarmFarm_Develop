package com.farmfarm.controller.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmfarm.exception.TransactionException;
import com.farmfarm.model.MyPageService;
import com.farmfarm.model.funding.FundingDetailService;
import com.farmfarm.model.funding.FundingService;

@Controller
@RequestMapping("/funding")
public class FundingController {

	@Autowired
	FundingService fundingService;

	@Autowired
	FundingDetailService fundingDetailService;
	
	@Autowired
	MyPageService myPageService;
	
	@PostMapping("/checkAccount")
	@ResponseBody
	public String checkAccount(HttpSession session) {
		String serial_num = (String) session.getAttribute("serial_num");
		int result = myPageService.checkAccount(serial_num);
		if(result == 1) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@GetMapping("/fundingList")
	public String showFundingList(Model model, HttpSession session) {
		String type = null;
		List<Map<String, Object>> fundingList = (List<Map<String, Object>>) fundingService.fundingListSelectAll(type);
		for (Map<String, Object> map : fundingList) {
			if (map.get("funding_pct") == null) {
				map.put("funding_pct", 0);
			}
		}
		model.addAttribute("fundingList", fundingList);
		String user_serial_num = (String) session.getAttribute("serial_num");
		System.out.println(user_serial_num);
		if (user_serial_num != null) {
			if (user_serial_num.substring(0, 2).equals("us")) {
				List<String> myBookmarkShowByUser = myPageService.myBookmarkShowByUser(user_serial_num);
				model.addAttribute("myBookmarkShowByUser", myBookmarkShowByUser);
			}
		}
		System.out.println(model);
		return "funding/fundingList";
	}

	@GetMapping("/fundingListByType")
	public String fundingListByType(String type, Model model, HttpSession session) {
		List<Map<String, Object>> fundingList = (List<Map<String, Object>>) fundingService
				.fundingListSelectByType(type);
		for (Map<String, Object> map : fundingList) {
			if (map.get("funding_pct") == null) {
				map.put("funding_pct", 0);
			}
		}
		String user_serial_num = (String) session.getAttribute("serial_num");
		if (user_serial_num != null) {
			if (user_serial_num.substring(0, 2).equals("us")) {
				List<String> myBookmarkShowByUser = myPageService.myBookmarkShowByUser(user_serial_num);
				model.addAttribute("myBookmarkShowByUser", myBookmarkShowByUser);
			}
		}
		model.addAttribute("fundingList", fundingList);
		return "funding/fundingList_ajax";
	}

	@GetMapping("/fundingMain")
	public String showFundingMain(Model model, HttpSession session) {
		session.setAttribute("headerSelect", "funding");
		List<Map<String, Object>> fundingList = (List<Map<String, Object>>) fundingService.fundingListSelectHot();
		for (Map<String, Object> map : fundingList) {
			if (map.get("funding_pct") == null) {
				map.put("funding_pct", 0);
			}
		}
		model.addAttribute("fundingListHot", fundingList);
		String user_serial_num = (String) session.getAttribute("serial_num");
		if (user_serial_num != null) {
			if (user_serial_num.substring(0, 2).equals("us")) {
				List<String> myBookmarkShowByUser = myPageService.myBookmarkShowByUser(user_serial_num);
				model.addAttribute("myBookmarkShowByUser", myBookmarkShowByUser);
			}
		}
		return "funding/fundingMain";
	}

	@GetMapping("/orderAll")
	public String showFundingFilter1(String type, Model model, HttpSession session) {
		List<Map<String, Object>> fundingList = (List<Map<String, Object>>) fundingService.fundingListSelectAll(type);
		for (Map<String, Object> map : fundingList) {
			if (map.get("funding_pct") == null) {
				map.put("funding_pct", 0);
			}
		}
		model.addAttribute("fundingList", fundingList);
		String user_serial_num = (String) session.getAttribute("serial_num");
		if (user_serial_num != null) {
			if (user_serial_num.substring(0, 2).equals("us")) {
				List<String> myBookmarkShowByUser = myPageService.myBookmarkShowByUser(user_serial_num);
				model.addAttribute("myBookmarkShowByUser", myBookmarkShowByUser);
			}
		}
		System.out.println(model);
		return "funding/fundingList_ajax";
	}

	@GetMapping("/orderSupport")
	public String showFundingFilter2(String type, Model model, HttpSession session) {
		List<Map<String, Object>> fundingList = (List<Map<String, Object>>) fundingService
				.fundingListSelectSupport(type);
		for (Map<String, Object> map : fundingList) {
			if (map.get("funding_pct") == null) {
				map.put("funding_pct", 0);
			}
		}
		model.addAttribute("fundingList", fundingList);
		String user_serial_num = (String) session.getAttribute("serial_num");
		if (user_serial_num != null) {
			if (user_serial_num.substring(0, 2).equals("us")) {
				List<String> myBookmarkShowByUser = myPageService.myBookmarkShowByUser(user_serial_num);
				model.addAttribute("myBookmarkShowByUser", myBookmarkShowByUser);
			}
		}
		return "funding/fundingList_ajax";
	}

	@GetMapping("/orderClosing")
	public String showFundingFilter3(String type, Model model, HttpSession session) {
		List<Map<String, Object>> fundingList = (List<Map<String, Object>>) fundingService
				.fundingListSelectClosing(type);
		for (Map<String, Object> map : fundingList) {
			if (map.get("funding_pct") == null) {
				map.put("funding_pct", 0);
			}
		}
		model.addAttribute("fundingList", fundingList);
		String user_serial_num = (String) session.getAttribute("serial_num");
		if (user_serial_num != null) {
			if (user_serial_num.substring(0, 2).equals("us")) {
				List<String> myBookmarkShowByUser = myPageService.myBookmarkShowByUser(user_serial_num);
				model.addAttribute("myBookmarkShowByUser", myBookmarkShowByUser);
			}
		}
		System.out.println(user_serial_num); //null
		return "funding/fundingList_ajax";
	}

	@GetMapping("/orderAmount")
	public String showFundingFilter4(String type, Model model, HttpSession session) {

		List<Map<String, Object>> fundingList = (List<Map<String, Object>>) fundingService
				.fundingListSelectAmount(type);
		for (Map<String, Object> map : fundingList) {
			if (map.get("funding_pct") == null) {
				map.put("funding_pct", 0);
			}
		}
		model.addAttribute("fundingList", fundingList);
		String user_serial_num = (String) session.getAttribute("serial_num");
		if (user_serial_num != null) {
			if (user_serial_num.substring(0, 2).equals("us")) {
				List<String> myBookmarkShowByUser = myPageService.myBookmarkShowByUser(user_serial_num);
				model.addAttribute("myBookmarkShowByUser", myBookmarkShowByUser);
			}
		}
		System.out.println(model);
		return "funding/fundingList_ajax";
	}

	@GetMapping("/orderRecent")
	public String showFundingFilter5(String type, Model model, HttpSession session) {

		List<Map<String, Object>> fundingList = (List<Map<String, Object>>) fundingService
				.fundingListSelectRecent(type);
		for (Map<String, Object> map : fundingList) {
			if (map.get("funding_pct") == null) {
				map.put("funding_pct", 0);
			}
		}
		model.addAttribute("fundingList", fundingList);
		String user_serial_num = (String) session.getAttribute("serial_num");
		if (user_serial_num != null) {
			if (user_serial_num.substring(0, 2).equals("us")) {
				List<String> myBookmarkShowByUser = myPageService.myBookmarkShowByUser(user_serial_num);
				model.addAttribute("myBookmarkShowByUser", myBookmarkShowByUser);
			}
		}
		System.out.println(model);
		return "funding/fundingList_ajax";
	}

	@GetMapping("/fundingSearch")
	public String fundingSearch(String input, Model model, HttpSession session) {

		List<Map<String, Object>> fundingList = (List<Map<String, Object>>) fundingService.fundingSearch(input);
		for (Map<String, Object> map : fundingList) {
			if (map.get("funding_pct") == null) {
				map.put("funding_pct", 0);
			}
		}
		System.out.println(fundingList);
		model.addAttribute("fundingList", fundingList);
		String user_serial_num = (String) session.getAttribute("serial_num");
		if (user_serial_num != null) {
			if (user_serial_num.substring(0, 2).equals("us")) {
				List<String> myBookmarkShowByUser = myPageService.myBookmarkShowByUser(user_serial_num);
				model.addAttribute("myBookmarkShowByUser", myBookmarkShowByUser);
			}
		}
		
		return "funding/fundingList_ajax";
	}

	@GetMapping("/fundingDetail")
	public String showFundingDetail(String product_serial_num, Model model, HttpSession session) {
		Map<String, Object> fundingInfo = (Map<String, Object>) fundingDetailService.fundingInfo(product_serial_num);
		model.addAttribute("bookmarkCnt", fundingDetailService.bookmarkCnt(product_serial_num));

		String user_serial_num = (String) session.getAttribute("serial_num");

		int fundingInfocnt = fundingDetailService.fundingInfocnt(product_serial_num);
		model.addAttribute("fundingInfocnt", fundingInfocnt);
		
		//추가한 부분
		model.addAttribute("user_serial_num",user_serial_num);
		
		if (user_serial_num != null) {
			if (user_serial_num.substring(0, 2).equals("us")) {
				int myBookmarkShow = fundingDetailService.myBookmarkShow(product_serial_num, user_serial_num);
				model.addAttribute("myBookmarkShow", myBookmarkShow);

				int user_point = fundingDetailService.pointCheck(user_serial_num);
				model.addAttribute("user_point", user_point);

				Map<String, Object> sumFunding = fundingDetailService.sumfunding(product_serial_num);
				int sumfundingamount = 0;
				double sumfundingpct = 0.0;
				if (sumFunding != null) {
					if (sumFunding != null && sumFunding.get("sumfundingamount") != null) {
						sumfundingamount = (int) sumFunding.get("sumfundingamount");
					}
					if (sumFunding != null && sumFunding.get("sumfundingpct") != null) {
						sumfundingpct = (double) sumFunding.get("sumfundingpct");
					}
				}

				model.addAttribute("sumfundingamount", sumfundingamount);
				model.addAttribute("sumfundingpct", sumfundingpct);
			}
		}


		String farmer_phone_origin = (String) fundingInfo.get("farmer_phone");
		String farmer_phone = farmer_phone_origin.replaceAll("(\\d{3})(\\d{4})(\\d{4})", "$1-$2-$3");
		fundingInfo.replace("farmer_phone", farmer_phone);
		model.addAttribute("fundingInfo", fundingInfo);

		return "funding/fundingDetail";
	}
	
	@ExceptionHandler(TransactionException.class)
	public ResponseEntity<String> handleAllExceptions(Exception e) {
	    return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
	}

	@PostMapping("/fundingBuy")
	public String showFundingBuy(String product_serial_num, Double pay, int payMoney, Model model,
			HttpSession session) {
		Map<String, Object> fundingInfo = (Map<String, Object>) fundingDetailService.fundingInfo(product_serial_num);
		String user_serial_num = (String) session.getAttribute("serial_num");
		System.out.println(user_serial_num);
		model.addAttribute("fundingInfo", fundingInfo);
		model.addAttribute("pay", pay);
		model.addAttribute("payMoney", payMoney);

		return "funding/fundingBuy";
	}
	
	@PostMapping("/fundingFinish")
	@ResponseBody
	public ResponseEntity<String> fundingProcess(String product_serial_num, Double pay, int payMoney, Model model,
			HttpSession session) {
		
		String user_serial_num = (String) session.getAttribute("serial_num");
		
		Map<String, Object> abc = new HashMap<String, Object>();
		abc.put("user_serial_num", user_serial_num);
		abc.put("product_serial_num", product_serial_num);
		abc.put("pay", pay);
		abc.put("payMoney", payMoney);
		
		try {
			String result = Integer.toString(fundingDetailService.fundingConfirm(abc));
			return ResponseEntity.ok(result);
		} catch (TransactionException e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
		}
	}
	
	@GetMapping("/fundingSuccess")
	public String showFundingFinish() {
		return "funding/fundingFinish";
	}
}
