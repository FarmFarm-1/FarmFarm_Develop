package com.farmfarm.model;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmfarm.dto.FarmersVO;
import com.farmfarm.dto.UsersVO;

@Service
public class SignUpService {

	@Autowired
	SignUpDAO dao;

	public void emailCheck(HttpServletResponse response, String email) throws IOException {
		int check = dao.emailCheck(response, email);

		PrintWriter out = response.getWriter();
		if (check == 0) {
			out.print("");
		} else {
			out.print("이미 등록된 이메일입니다.");
			out.close();
		}

	}

	public void sendCerNum(HttpServletResponse response, String mail) throws IOException {
		PrintWriter out = response.getWriter();

		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; // 네이버 이용시 smtp.naver.com
		String hostSMTPid = "jieunjenny00@gmail.com";
		String hostSMTPpwd = "sful kgka ozgg gzhg";
		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "farmfarm@google.com";
		String fromName = "팜팜 FarmFarm";
		String subject = "";
		String msg = "";

		String cerNum = "";
		for (int i = 0; i < 6; i++) {
			cerNum += (char) ((Math.random() * 26) + 97);
		}

		subject = "팜팜 회원가입 인증번호 입니다.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += "팜팜 회원가입 인증번호 입니다. 입력후 인증확인을 눌러주세요.</h3>";
		msg += "<p>인증번호 : ";
		msg += cerNum + "</p></div>";

		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); // 네이버 이용시 587
			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}

		out.print(cerNum);
		out.close();

	}

	// users 회원가입
	public int userSignUp(UsersVO users) {
		return dao.userSignUp(users);
	}

	// farmers 회원가입
	public int farmerSignUp(FarmersVO farmers) {
		return dao.farmerSignUp(farmers);
	}
}
