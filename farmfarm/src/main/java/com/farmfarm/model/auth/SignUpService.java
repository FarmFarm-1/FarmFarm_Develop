package com.farmfarm.model.auth;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
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
		/*
		 * msg +=
		 * "<div align='center' style='border:1px solid black; font-family:verdana'>";
		 * msg += "<h3 style='color: blue;'>"; msg +=
		 * "팜팜 회원가입 인증번호 입니다. 입력후 인증확인을 눌러주세요.</h3>"; msg += "<p>인증번호 : "; msg += cerNum
		 * + "</p></div>";
		 */
		
		msg +="<img style=\"margin-top: 1rem; height:55px;\" src=\"https://farmfarmimagess.s3.ap-northeast-2.amazonaws.com/farmfarmlogo.png\" />";
		msg +="<h2>팜팜 이메일 인증 안내</h2>";
		msg +="<p>안녕하세요, 고객님</p>";
		msg +="&nbsp;";
		msg +="<p><b>'회원가입'</b>을 위해 이메일 인증을 진행합니다.</p>";
		msg +="&nbsp;";
		msg +="<p>아래 발급된 이메일 인증번호를 복사하거나 직접 입력하여 인증을 완료해주세요.</p>";
		msg +="&nbsp;";
		msg +="<p style=\"height: 0.1rem; background-color: #d9d9d9; width: 38rem;\"></p>";
		msg +="<h2 style=\"margin-left: 13rem;\">인증번호 : </h2>";
		msg +="<h2 style=\"position: relative; bottom: 3.2rem; color:#64a246; margin-left: 21rem; \">" + cerNum + "</h2>";
		msg +="<p style=\"position: relative; top: -3rem; height: 0.1rem; background-color: #d9d9d9; width: 38rem;\"></p>";

		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSLOnConnect(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); // 네이버 이용시 587
			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setStartTLSEnabled(true);
			email.addTo(mail);
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