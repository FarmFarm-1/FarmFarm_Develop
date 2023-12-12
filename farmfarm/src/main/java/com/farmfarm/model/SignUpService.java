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
			out.print("�̹� ��ϵ� �̸����Դϴ�.");
			out.close();
		}

	}

	public void sendCerNum(HttpServletResponse response, String mail) throws IOException {
		PrintWriter out = response.getWriter();

		// Mail Server ����
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; // ���̹� �̿�� smtp.naver.com
		String hostSMTPid = "jieunjenny00@gmail.com";
		String hostSMTPpwd = "sful kgka ozgg gzhg";
		// ������ ��� EMail, ����, ����
		String fromEmail = "farmfarm@google.com";
		String fromName = "���� FarmFarm";
		String subject = "";
		String msg = "";

		String cerNum = "";
		for (int i = 0; i < 6; i++) {
			cerNum += (char) ((Math.random() * 26) + 97);
		}

		subject = "���� ȸ������ ������ȣ �Դϴ�.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += "���� ȸ������ ������ȣ �Դϴ�. �Է��� ����Ȯ���� �����ּ���.</h3>";
		msg += "<p>������ȣ : ";
		msg += cerNum + "</p></div>";

		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); // ���̹� �̿�� 587
			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("���Ϲ߼� ���� : " + e);
		}

		out.print(cerNum);
		out.close();

	}

	// users ȸ������
	public int userSignUp(UsersVO users) {
		return dao.userSignUp(users);
	}

	// farmers ȸ������
	public int farmerSignUp(FarmersVO farmers) {
		return dao.farmerSignUp(farmers);
	}
}
