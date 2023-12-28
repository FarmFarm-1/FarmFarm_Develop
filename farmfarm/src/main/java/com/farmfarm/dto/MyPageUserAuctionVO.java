package com.farmfarm.dto;

import java.sql.Date;
import java.sql.Timestamp;

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
public class MyPageUserAuctionVO {
	
	String product_serial_num;
	String auction_thumb_img_url;
	String product_name;
	String farm_name;
	String farm_address; 
	/* Timestamp auction_deadline; */
	Date auction_deadline;
	String product_status;
	int max_user_price;
	int d_day;
	String auction_status;
	
}
