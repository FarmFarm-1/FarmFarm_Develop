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
public class Farm_and_productVO {
	String product_serial_num;
	String product_kind;
	String product_name;
	String product_status;
	String farmer_phone;
	String farmer_serial_num;
	String farm_name;
	String farm_address;
	String farm_introduction;
	int farm_square_footage;
	Date expected_planting_date;
	Date expected_harvest_date;
	Date product_regdate;
	String funding_thumb_img_url;
	String funding_product_img_url;
	String auction_thumb_img_url;
	String auction_product_img_url;
}
