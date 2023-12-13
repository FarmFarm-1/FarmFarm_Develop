package com.farmfarm.model;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmfarm.dto.FarmersVO;

@Service
public class FarmersService {
	
	@Autowired
	FarmersDAO dao;

	public String loginCheck(FarmersVO f) {
		// TODO Auto-generated method stub
		return dao.loginCheck(f);
	}
	
	public void sendEmail(FarmersVO vo, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "boh3430@gmail.com";
		String hostSMTPpwd = "serg vdkm jgrn waty";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "farmfarm@google.com";
		String fromName = "팜팜 FarmFarm";
		String subject = "";
		String msg = "";

		if(div.equals("findpw")) {
			subject = "팜팜 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getFarmer_email() + "님의 임시 비밀번호 입니다. 로그인 후 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getFarmer_pw() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = vo.getFarmer_email();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSLOnConnect(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); //네이버 이용시 587

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
	}

	//비밀번호찾기
	public void findPw(HttpServletResponse response, FarmersVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		
		String result = dao.readMember(vo.getFarmer_email());
		PrintWriter out = response.getWriter();
		// 가입된 이메일이 아니면
		if(result == null ) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			vo.setFarmer_pw(pw);
			// 비밀번호 변경
			dao.updatePw(vo);
			// 비밀번호 변경 메일 발송
			sendEmail(vo, "findpw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}

}
