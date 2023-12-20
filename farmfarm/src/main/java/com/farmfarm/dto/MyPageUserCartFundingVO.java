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
	String auction_thumb_img_url;
	String product_name;
	String min_amount;
	Date expected_planting_date;
	int farm_square_footage;
	int funding_pct;
	int d_day;
	String is_cart;
}
