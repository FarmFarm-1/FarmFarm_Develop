package com.farmfarm.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Farmer_account_historyVO {
	
	int farmer_account_history_serial_num;
	String farmer_serial_num;
	String farmer_account;
	String farmer_bank;
	Date update_date;
	
}
