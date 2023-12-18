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

	// 鍮꾨�踰덊샇 李얘린 �씠硫붿씪諛쒖넚
	public void sendEmail(UsersVO vo, String pw) throws Exception {
		// Mail Server �꽕�젙
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; // �꽕�씠踰� �씠�슜�떆 smtp.naver.com
		String hostSMTPid = "boh3430@gmail.com";
		String hostSMTPpwd = "serg vdkm jgrn waty";

		// 蹂대궡�뒗 �궗�엺 EMail, �젣紐�, �궡�슜
		String fromEmail = "farmfarm@google.com";
		String fromName = "�뙗�뙗 FarmFarm";

		String subject = "";
		String msg = "";

		subject = "�뙗�뙗 �엫�떆 鍮꾨�踰덊샇 �엯�땲�떎.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += vo.getUser_email() + "�떂�쓽 �엫�떆 鍮꾨�踰덊샇 �엯�땲�떎. 濡쒓렇�씤 �썑 鍮꾨�踰덊샇瑜� 蹂�寃쏀븯�뿬 �궗�슜�븯�꽭�슂.</h3>";
		msg += "<p>�엫�떆 鍮꾨�踰덊샇 : ";
		msg += pw + "</p></div>";

		// 諛쏅뒗 �궗�엺 E-Mail 二쇱냼
		String mail = vo.getUser_email();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSLOnConnect(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); // �꽕�씠踰� �씠�슜�떆 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setStartTLSEnabled(true);
			email.addTo(mail);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("硫붿씪諛쒖넚 �떎�뙣 : " + e);
		}
	}

	// 鍮꾨�踰덊샇李얘린
	public void findPw(HttpServletResponse response, UsersVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		System.out.println("Serv.findPW -> ");
		System.out.println(vo.getUser_email());

		String result = dao.readMember(vo.getUser_email());
		PrintWriter out = response.getWriter();
		// 媛��엯�맂 �씠硫붿씪�씠 �븘�땲硫�
		if (result == null) {
			out.print("�벑濡앸릺吏� �븡�� �씠硫붿씪�엯�땲�떎.");
			out.close();
		} else {
			// �엫�떆 鍮꾨�踰덊샇 �깮�꽦
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			String setP = pwdSha256.encrypt(pw);
			vo.setUser_pw(setP);
			// 鍮꾨�踰덊샇 蹂�寃�
			dao.updatePw(vo);
			// 鍮꾨�踰덊샇 蹂�寃� 硫붿씪 諛쒖넚
			sendEmail(vo, pw);

			out.print("�씠硫붿씪濡� �엫�떆 鍮꾨�踰덊샇瑜� 諛쒖넚�븯���뒿�땲�떎.");
			out.close();
		}
	}
	
	public int changePw(String user_serial_num, String user_pw) throws Exception {
	    UsersVO vo = new UsersVO();
	    vo.setUser_serial_num(user_serial_num);
	    vo.setUser_pw(user_pw);
	    return dao.changePw(vo);
	}
}
