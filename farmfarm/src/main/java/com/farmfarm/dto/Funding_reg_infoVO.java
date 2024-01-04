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
public class Funding_reg_infoVO{
	String product_serial_num;
	int target_total_amount;
	Date funding_deadline; 
}
