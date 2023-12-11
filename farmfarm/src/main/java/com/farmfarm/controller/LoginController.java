package com.farmfarm.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.farmfarm.dto.FarmersVO;
import com.farmfarm.dto.UsersVO;
import com.farmfarm.model.FarmersService;
import com.farmfarm.model.UsersService;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	UsersService uService;

	@Autowired
	FarmersService fService;

	@RequestMapping(value = "/findPassword.do/user", method = RequestMethod.GET)
	public String findUser(HttpServletRequest request, HttpSession session) {
		session.setAttribute("curFind", "user");
		return "login/find";
	}

	@RequestMapping(value = "/findPassword.do/farmer", method = RequestMethod.GET)
	public String findFarmer(HttpServletRequest request, HttpSession session) {
		session.setAttribute("curFind", "farmer");
		return "login/find";
	}

	@RequestMapping(value = "/findPassword.do", method = RequestMethod.POST)
	public void findPwPOST(String email, HttpServletResponse response, HttpSession session) throws Exception {

		String str = (String) session.getAttribute("curFind");
		if (str.equals("user")) {
			UsersVO user = new UsersVO();
			user.setUser_email(email);
			uService.findPw(response, user);
		} else {
			FarmersVO farmer = new FarmersVO();
			farmer.setFarmer_email(email);
			fService.findPw(response, farmer);
		}

	}

	@RequestMapping(value = "/userLogin.do", method = RequestMethod.POST)
	public void userLogin(String user_email, String user_pw, HttpServletResponse response, HttpSession session)
			throws IOException {

		UsersVO u = new UsersVO();
		u.setUser_email(user_email);
		u.setUser_pw(user_pw);

		String serial_num = uService.loginCheck(u);
		if (serial_num != null) {
			session.setAttribute("serial_num", serial_num);
			response.getWriter().print(true);
			System.out.println(session.getAttribute(serial_num));
		} else {
			response.getWriter().print(false);
		}

	}

	@RequestMapping(value = "/farmerLogin.do", method = RequestMethod.POST)
	public void farmerLogin(String farmer_email, String farmer_pw, HttpServletResponse response, HttpSession session)
			throws IOException {

		FarmersVO f = new FarmersVO();
		f.setFarmer_email(farmer_email);
		f.setFarmer_pw(farmer_pw);

		String serial_num = fService.loginCheck(f);
		if (serial_num != null) {
			session.setAttribute("serial_num", serial_num);
			response.getWriter().print(true);
		} else {
			response.getWriter().print(false);
		}

	}

}
