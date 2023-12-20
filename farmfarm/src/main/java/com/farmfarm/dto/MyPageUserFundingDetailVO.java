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
public class MyPageUserFundingDetailVO{
	int update_serial_num;
	String product_serial_num; 
	String cultivate_status;
	Date update_date;
	String cultivating_image;
	String cultivating_content;
	String fertilizer_content;
	int fertilizer_amount;
	String etc_content;
}
