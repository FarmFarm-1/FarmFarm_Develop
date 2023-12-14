package com.farmfarm.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.farmfarm.model.FundingDetailService;

@Controller
@RequestMapping("/funding")
public class FundingController {

	@Autowired
	FundingDetailService fundingService;

	@GetMapping("/fundingList")
	public String showFundingList(Model model) {

		model.addAttribute("fundingList", fundingService.fundingListSelectAll());
		return "funding/fundingList";
	}

	@GetMapping("/fundingDetail")
	public String showFundingDetail(String product_serial_num, Model model, HttpSession session) {
		Map<String, Object> fundingInfo = (Map<String, Object>) fundingService.fundingInfo(product_serial_num);
		model.addAttribute("bookmarkCnt", fundingService.bookmarkCnt(product_serial_num));

		// 유저 번호 체크 (us면 서포터, fa면 파머)
		String user_serial_num = (String) session.getAttribute("serial_num");

		if (user_serial_num != null) {
			if (user_serial_num.substring(0, 2).equals("us")) {
				int myBookmarkShow = fundingService.myBookmarkShow(product_serial_num, user_serial_num);
				model.addAttribute("myBookmarkShow", myBookmarkShow);

				int user_point = fundingService.pointCheck(user_serial_num);
				model.addAttribute("user_point", user_point);

				Map<String, Object> sumFunding = fundingService.sumfunding(product_serial_num);
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

		// 폰넘버 출력 양식 변경
		String farmer_phone_origin = (String) fundingInfo.get("farmer_phone");
		String farmer_phone = farmer_phone_origin.replaceAll("(\\d{3})(\\d{4})(\\d{4})", "$1-$2-$3");
		fundingInfo.replace("farmer_phone", farmer_phone);
		model.addAttribute("fundingInfo", fundingInfo);

		return "funding/fundingDetail";
	}

	@PostMapping("/fundingBuy")
	public String showFundingBuy(String product_serial_num, Double pay, int payMoney, Model model,
			HttpSession session) {
		Map<String, Object> fundingInfo = (Map<String, Object>) fundingService.fundingInfo(product_serial_num);
		String user_serial_num = (String) session.getAttribute("serial_num");
		System.out.println(user_serial_num);
		model.addAttribute("fundingInfo", fundingInfo);
		model.addAttribute("pay", pay);
		model.addAttribute("payMoney", payMoney);

		Map<String, Object> abc = new HashMap<String, Object>();
		abc.put("user_serial_num", user_serial_num);
		abc.put("product_serial_num", product_serial_num);
		abc.put("pay", pay);
		abc.put("payMoney", payMoney);
		System.out.println(abc);

		Map<String, Object> sumFunding = fundingService.sumfunding(product_serial_num);
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

		int cnt = fundingService.selectcnt(abc);
		if (cnt > 0) {
			fundingService.updateFunding(abc);
		} else {
			fundingService.buyFunding(abc);
		}
		return "funding/fundingBuy";
	}

	@GetMapping("/fundingFinish")
	public String showFundingFinish() {

		return "funding/fundingFinish";

	}
}
