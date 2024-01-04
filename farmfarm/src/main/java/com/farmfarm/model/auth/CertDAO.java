package com.farmfarm.model.auth;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;

@Repository
public class CertDAO {

	@Value("${imp_key_cert}")
	private String imp_key;

	@Value("${imp_secret_cert}")
	private String imp_secret;

	public String cert(String uid) {

		String impKey = "본인키";
		String impSecret = "본인키";
		String strUrl = "https://api.iamport.kr/users/getToken"; // 토큰 요청 보낼 주소
		String access_token = " ";
		String name = "";

		try {
			URL url = new URL(strUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setDoOutput(true); // outputStreamm으로 post 데이터를 넘김

			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Accept", "application/json");

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			JSONObject requestObj = new JSONObject();
			requestObj.put("imp_key", imp_key);
			requestObj.put("imp_secret", imp_secret);

			bw.write(requestObj.toString());
			bw.flush();
			bw.close();

			int responseCode = conn.getResponseCode();

			if (responseCode == 200) {
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				StringBuilder sb = new StringBuilder();
				String line;
				while ((line = br.readLine()) != null) {
					sb.append(line + "\n");
				}
				br.close();

				// token extract
				String response = sb.toString();
				JSONParser jsonParser = new JSONParser();
				JSONObject jsonObj = (JSONObject) jsonParser.parse(sb.toString());
				access_token = (String) ((JSONObject) jsonObj.get("response")).get("access_token");

				String getPaymentUrl = "https://api.iamport.kr/certifications/" + uid;
				HttpURLConnection getConn = (HttpURLConnection) new URL(getPaymentUrl).openConnection();
				getConn.setRequestMethod("GET");
				getConn.setRequestProperty("Content-Type", "application/json");
				getConn.setRequestProperty("Authorization", "Bearer " + access_token);

				int getResponseCode = getConn.getResponseCode();

				if (getResponseCode == 200) { // 성공
					BufferedReader getBr = new BufferedReader(new InputStreamReader(getConn.getInputStream()));
					StringBuilder getResponseSb = new StringBuilder();
					String getLine;
					while ((getLine = getBr.readLine()) != null) {
						getResponseSb.append(getLine).append("\n");
					}
					getBr.close();

					String getResponse = getResponseSb.toString();
					System.out.println("GET 응답 결과: " + getResponse);

					JSONParser parser1 = new JSONParser();
					JSONObject phoneJson1 = (JSONObject) parser1.parse(getResponse);

					name = (String) ((JSONObject) phoneJson1.get("response")).get("name");

				} else {
					System.out.println("GET 에러 응답 메시지: " + getConn.getResponseMessage());
				}

			} else {
				System.out.println("error");
			}

		} catch (IOException | ParseException e) {
			e.printStackTrace();
		}

		return name;
	}

}
