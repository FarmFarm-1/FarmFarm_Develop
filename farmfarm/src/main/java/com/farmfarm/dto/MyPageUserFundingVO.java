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
public class MyPageUserFundingVO {

	String funding_thumb_img_url;
	String product_name;
	String farm_name;
	String farm_address;
	Date user_funding_date;
	int total_funding_pct;
	int user_funding_amout;
	double user_funding_pct;
	String product_status;
}
