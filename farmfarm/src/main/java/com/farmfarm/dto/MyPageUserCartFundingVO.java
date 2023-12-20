package com.farmfarm.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MyPageUserCartFundingVO {
	String product_serial_num;
	String product_status;
	String funding_thumb_img_url;
	String auction_thumb_img_url;
	String product_name;
	Date expected_planting_date;
	Date expected_harvest_date;
	int farm_square_footage;
	int harvest_amount;
	int min_amount;
	int d_day;
	int current_price;
	int total_pct;
	int participants;
}
