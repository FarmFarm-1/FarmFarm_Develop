package com.farmfarm.model;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmfarm.dto.UsersVO;

@Service
public class UsersService {

	@Autowired
	UsersDAO dao;

	public String loginCheck(UsersVO u) {
		return dao.loginCheck(u);
	}

	//비밀번호 찾기 이메일발송
	public void sendEmail(UsersVO vo, String pw) throws Exception {
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

		subject = "팜팜 임시 비밀번호 입니다.";
		msg +="<img style=\"margin-top: 1rem; height:55px;\" src=\"https://farmfarmimagess.s3.ap-northeast-2.amazonaws.com/farmfarmlogo.png\" />";
		msg +="<h2>팜팜 이메일 인증 안내</h2>";
		msg +="<p>안녕하세요, 고객님</p>";
		msg +="&nbsp;";
		msg +="<p>아래 발급된 임시비밀번호를 복사하거나 직접 입력하여 로그인 후 비밀번호를 변경해주세요.</p>";
		msg +="&nbsp;";
		msg +="<p style=\"height: 0.1rem; background-color: #d9d9d9; width: 38rem;\"></p>";
		msg +="<h2 style=\"margin-left: 10rem;\">임시비밀번호 : </h2>";
		msg +="<h2 style=\"color:#64a246; margin-left: 21rem; position: relative; bottom: 3.2rem;\">" + pw + "</h2>";
		msg +="<p style=\"height: 0.1rem; background-color: #d9d9d9; position: relative; top: -3rem; width: 38rem;\"></p>";

		// 받는 사람 E-Mail 주소
		String mail = vo.getUser_email();
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
			System.out.println("메일발송 실패  : " + e);
		}
	}

	// 비밀번호찾기
	public void findPw(HttpServletResponse response, UsersVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		System.out.println("Serv.findPW -> ");
		System.out.println(vo.getUser_email());

		String result = dao.readMember(vo.getUser_email());
		PrintWriter out = response.getWriter();
		// 가입된 이메일이 아니면
		if (result == null) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		} else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			String setP = pwdSha256.encrypt(pw);
			vo.setUser_pw(setP);
			// 비밀번호 변경
			dao.updatePw(vo);
			// 비밀번호 변경 메일 발송
			sendEmail(vo, pw);

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}
	
	//재호
	public String pwCheck(String user_serial_num){
		return dao.pwCheck(user_serial_num);
	}
	
	public int changePw(String user_serial_num, String user_pw) throws Exception {
	    UsersVO vo = new UsersVO();
	    vo.setUser_serial_num(user_serial_num);
	    vo.setUser_pw(user_pw);
	    return dao.changePw(vo);
	}
	//재호
}
