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
public class User_account_historyVO {
	
	int user_account_history_serial_num;
	String user_serial_num;
	String user_account;
	String user_bank;
	Date update_date;
	
}
