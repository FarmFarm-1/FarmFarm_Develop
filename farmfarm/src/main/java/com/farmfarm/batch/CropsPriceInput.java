package com.farmfarm.batch;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;

import com.farmfarm.model.AuctionService;

public class CropsPriceInput {
	@Autowired
	AuctionService auctionService;
	
	static LinkedList<LinkedHashMap<String, String>> jsonOutput() {
		LinkedList<LinkedHashMap<String, String>> resultData = new LinkedList<>();
		try {
			StringBuilder sb = new StringBuilder();
			String line;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c1 = Calendar.getInstance();
			c1.add(Calendar.DATE, -1);
			String yesterday = sdf.format(c1.getTime());

			String dailySalesList = "https://www.kamis.or.kr/service/price/xml.do?action=dailyPriceByCategoryList"
					+ "&p_product_cls_code=02" 
					+ "&p_regday=" + yesterday 
					+ "&p_convert_kg_yn=Y"
					+ "&p_item_category_code=100" 
					+ "&p_cert_key=479dabdd-7aa2-43d5-9b8f-6e4712d863f2"
					+ "&p_cert_id=3836" 
					+ "&p_returntype=json";

			URL url = new URL(dailySalesList);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setInstanceFollowRedirects(true);
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			System.out.println(conn.getResponseCode());

			// API 응답메시지를 불러와서 문자열로 저장
			BufferedReader rd;
			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
			}
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}
			rd.close();
			conn.disconnect();
			String result = sb.toString();

			// JSONObject
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
			JSONObject data = (JSONObject) jsonObject.get("data");
			JSONArray priceInfo = (JSONArray) data.get("item");
			// 입력 조건 생성
			String rank_code = "04";
			String rice_item_name = "쌀";
			String rice_item_code = "111";
			String rice_kind_code = "01";
			String bean_item_name = "콩";
			String bean_item_code = "141";
			String bean_kind_code = "01";
			String red_bean_item_name = "팥";
			String red_bean_item_code = "142";
			String red_bean_kind_code = "00";
			String green_gram_item_name = "녹두";
			String green_gram_item_code = "143";
			String green_gram_kind_code = "00";
			String sweet_potato_item_name = "고구마";
			String sweet_potato_item_code = "151";
			String sweet_potato_kind_code = "00";
			String potato_item_name = "감자";
			String potato_item_code = "152";
			String potato_kind_code = "01";

			ArrayList<String> cropsList = new ArrayList<String>(
					Arrays.asList("rice", "bean", "red_bean", "green_gram", "sweet_potato", "potato"));

			List<LinkedHashMap<String, String>> popsList = new LinkedList<>();
			
			for (int i = 0; i < cropsList.size(); i++) {
				popsList.add(new LinkedHashMap<String, String>());
				String actualItemName = null;
				String actualItemCode = null;
				String actualKindCode = null;

				switch (cropsList.get(i)) {
				case "rice":
					actualItemName = rice_item_name;
					actualItemCode = rice_item_code;
					actualKindCode = rice_kind_code;
					break;
				case "bean":
					actualItemName = bean_item_name;
					actualItemCode = bean_item_code;
					actualKindCode = bean_kind_code;
					break;
				case "red_bean":
					actualItemName = red_bean_item_name;
					actualItemCode = red_bean_item_code;
					actualKindCode = red_bean_kind_code;
					break;
				case "green_gram":
					actualItemName = green_gram_item_name;
					actualItemCode = green_gram_item_code;
					actualKindCode = green_gram_kind_code;
					break;
				case "sweet_potato":
					actualItemName = sweet_potato_item_name;
					actualItemCode = sweet_potato_item_code;
					actualKindCode = sweet_potato_kind_code;
					break;
				case "potato":
					actualItemName = potato_item_name;
					actualItemCode = potato_item_code;
					actualKindCode = potato_kind_code;
					break;
				default:
					break;
				}
				popsList.get(i).put("item_name", actualItemName);
				popsList.get(i).put("item_code", actualItemCode);
				popsList.get(i).put("kind_code", actualKindCode);
				popsList.get(i).put("rank_code", rank_code);
			}
			
			// json에서 추출
			for (int i = 0; i < priceInfo.size(); i++) {
				JSONObject cur_jsonObject = (JSONObject) priceInfo.get(i);

				for (int j = 0; j < popsList.size(); j++) {
					boolean match = true;
					LinkedHashMap<String, String> pop = popsList.get(j);
					for (String key : pop.keySet()) {
						if (!cur_jsonObject.get(key).equals(pop.get(key))) {
							match = false;
							break;
						}
					}
					if(match) {
			            LinkedHashMap<String, String> input = new LinkedHashMap<>();
			            for(String key : pop.keySet()) {
			            	input.put(key, (String)cur_jsonObject.get(key));
			            }
			            
			            String formattedPrice = ((String)cur_jsonObject.get("dpr1")).replace(",", "");
			            input.put("price", formattedPrice);
			            resultData.add(input);
			        }
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultData;
	}
	public static void main(String[] args) {
		
		LinkedList<LinkedHashMap<String, String>> data= jsonOutput();
	}
}
