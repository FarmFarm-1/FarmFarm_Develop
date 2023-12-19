package com.farmfarm.model;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.farmfarm.dto.Farmer_account_historyVO;
import com.farmfarm.dto.User_account_historyVO;
import com.farmfarm.dto.User_cartVO;
import com.farmfarm.dto.UsersVO;

@Service
public class MyPageService {
	
	@Value("${impIdentifierCode}")
	private String impIdentifierCode;
	
	@Value("${imp_key}")
	private String imp_key;
	
	@Value("${imp_secret}")
	private String imp_secret;
	
	@Autowired
	MyPageDAO myPageDAO;
		
	Logger logger = LoggerFactory.getLogger(MyPageService.class);
	public int addMyCart(User_cartVO user_cartVO) {
		return myPageDAO.addMyCart(user_cartVO);
	}
	
	public int deletecart(User_cartVO user_cartVO) {
		return myPageDAO.deletecart(user_cartVO);
	}
	
	public int bookmarkCnt(String product_serial_num) {
		return myPageDAO.bookmarkCnt(product_serial_num);
	}
	
	public int pointCheck(String user_serial_num) {
		return myPageDAO.pointCheck(user_serial_num);
	}
	
	public int myBookmarkShow(String product_serial_num, String user_serial_num) {
		HashMap<String, Object> data = new HashMap<>();
		data.put("user_serial_num", user_serial_num);
		data.put("product_serial_num", product_serial_num);
		return myPageDAO.myBookmarkShow(data);
	}
	
	//cart
	public List<String> myBookmarkShowList(String user_serial_num) {
		return myPageDAO.myBookmarkShowList(user_serial_num);
	}

	public List<String> myBookmarkShowByUser(String user_serial_num) {
		return myPageDAO.myBookmarkShowByUser(user_serial_num);
	}

	public int chargePointCfrm(int paid_amount, HttpSession session) {
		String user_serial_num = (String)session.getAttribute("serial_num");
		Map<String, Object> data = new HashMap<>();
		data.put("user_serial_num", user_serial_num);
		data.put("amount",paid_amount);
		int result = myPageDAO.chargePointCfrm(data);
		return result;
	}

	public UsersVO getUserInfoForChargingPoint(HttpSession session) {
		String user_serial_num = (String) session.getAttribute("serial_num");
		return myPageDAO.getUserInfoForChargingPoint(user_serial_num);
	}

	public HashMap<String, Object> accountExistence(HttpSession session) {
		
		HashMap<String, Object> data = new HashMap<>();
		String serial_num = (String) session.getAttribute("serial_num");
		if(serial_num.substring(0,2).equals("us")) {
			String user_name = myPageDAO.getUserInfoForVerifyAccount(serial_num);
			User_account_historyVO vo = myPageDAO.accountExistenceUser(serial_num);
			data.put("account_holder", user_name);
			data.put("account_info", vo);
		} else if (serial_num.substring(0,2).equals("FA"))  {
			String farmer_name = myPageDAO.getFarmerInfoForVerifyAccount(serial_num);
			Farmer_account_historyVO vo = myPageDAO.accountExistenceFarmer(serial_num);
			data.put("account_holder", farmer_name);
			data.put("account_info", vo);
		}
		return data;
	}
	
	
	public HashMap<String, String> farmMoneyChargeCallAPI(HttpSession session) {
		String user_serial_num = (String) session.getAttribute("serial_num");
		UsersVO vo = myPageDAO.getUserInfoForChargingPoint(user_serial_num);
		String impIdentifier = impIdentifierCode;
		HashMap<String, String> data = new HashMap<>();
		data.put("user_email", vo.getUser_email());
		data.put("user_name", vo.getUser_name());
		data.put("impIdentifier", impIdentifier);
		return data;
	}

	public String verifyAndRegAccount(HashMap<String, String> data, HttpSession session) {
		System.out.println(data);
		String returnMessage = "";
		try {
			//token issuing
			String getAccessToken = "https://api.iamport.kr/users/getToken";
			URL url = new URL(getAccessToken);
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true); // outputStreamm으로 post 데이터를 넘김
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Accept", "application/json");
			
			//parameter setting
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			JSONObject requestObj = new JSONObject();
			requestObj.put("imp_key", imp_key);
			requestObj.put("imp_secret", imp_secret);
			
			bw.write(requestObj.toString());
			bw.flush();
			bw.close();
			int responseCode = conn.getResponseCode();
			logger.warn(responseCode+"");
			if(responseCode == 200) {
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				StringBuilder sb = new StringBuilder();
				String line;
				while ((line = br.readLine()) != null) {
					sb.append(line + "\n");
				}
				br.close();
				
				//token extract
				JSONParser jsonParser = new JSONParser();
				JSONObject jsonObj = (JSONObject)jsonParser.parse(sb.toString());
				String access_token= (String)((JSONObject)jsonObj.get("response")).get("access_token");
				logger.warn(access_token);
				
				//verify account
				String bank_code = data.get("bank_code");
				String bank_num = data.get("bank_num");
				String bank_name_kr = data.get("bank_name_kr");
				String verifyUrl = "https://api.iamport.kr/vbanks/holder";
				String query = String.format("?bank_code=%s&bank_num=%s", URLEncoder.encode(bank_code, "UTF-8"),
						URLEncoder.encode(bank_num, "UTF-8"));
				url = new URL(verifyUrl+query);
				conn = (HttpURLConnection)url.openConnection();
				conn.setRequestMethod("GET");
				conn.setDoOutput(true); // outputStreamm으로 post 데이터를 넘김
				conn.setRequestProperty("Content-Type", "application/json");
				conn.setRequestProperty("Accept", "application/json");
				conn.setRequestProperty("Authorization", "Bearer " + access_token);
				
				int verifyConnResult = conn.getResponseCode();
				logger.warn("verifyConnResult>>> "+verifyConnResult);
				if(verifyConnResult == 200) {
					br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
					sb = new StringBuilder();
					String line2;
					while ((line2 = br.readLine()) != null) {
						sb.append(line2 + "\n");
					}
					br.close();
					
					//result extract
					jsonObj = (JSONObject)jsonParser.parse(sb.toString());
					String output_bank_holder = (String)((JSONObject)jsonObj.get("response")).get("bank_holder");
					logger.warn("output_bank_holder>>> "+output_bank_holder);
					String serial_num = (String)session.getAttribute("serial_num");
					
					//account verify
					HashMap<String, String> sqlInputData = new HashMap<>();
					if(serial_num.substring(0,2).equals("us")) { //user
						String db_user_name = myPageDAO.getUserInfoForVerifyAccount(serial_num);
						if(output_bank_holder.equals(db_user_name)) {
							sqlInputData.put("user_serial_num",serial_num);
							sqlInputData.put("user_account", bank_num);
							sqlInputData.put("user_bank", bank_name_kr);
							int insertResult = myPageDAO.registerAccountUser(sqlInputData);
							logger.warn("insertResult>>> "+insertResult);
							if(insertResult == 1) {
								returnMessage = "AccountRegisterSuccess";
							} else {
								returnMessage = "AccountRegisterFail";
							}
						} else {
							return "NotCoincide";
						}
					} else if(serial_num.substring(0,2).equals("FA")){ //farmer
						String db_farmer_name = myPageDAO.getFarmerInfoForVerifyAccount(serial_num);
						if(output_bank_holder.equals(db_farmer_name)) {
							sqlInputData.put("farmer_serial_num",serial_num);
							sqlInputData.put("farmer_account", bank_num);
							sqlInputData.put("farmer_bank", bank_name_kr);
							int insertResult = myPageDAO.registerAccountFarmer(sqlInputData);
							logger.warn("insertResult>>> "+insertResult);
							if(insertResult == 1) {
								returnMessage = "AccountRegisterSuccess";
							} else {
								returnMessage = "AccountRegisterFail";
							}
						} else {
							return "NotCoincide";
						}
					} else {
						return "NotRegisteredPerson";
					}			
				} else {
					logger.warn("parssing error");
					return "ParssingError";
				}
			}
			
		} catch (IOException | ParseException e) {
			e.printStackTrace();
			returnMessage = "ExceptionError";
		}
		
		return returnMessage;
	}

}
