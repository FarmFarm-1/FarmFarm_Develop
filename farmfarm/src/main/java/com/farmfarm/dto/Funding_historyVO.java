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
public class Funding_historyVO{
	int funding_serial_num;
	String product_serial_num;
	String user_serial_num;
	int user_funding_amount;
	int funding_amount;
	double user_funding_pct;
	Date user_funding_deadline; 
}
