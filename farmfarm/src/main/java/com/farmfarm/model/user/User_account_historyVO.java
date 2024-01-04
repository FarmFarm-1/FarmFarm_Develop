package com.farmfarm.model.user;

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
public class User_account_historyVO {
	 private int user_account_history_serial_num;
	 private String user_serial_num;
	 private String user_account;
	 private String user_bank;
	 Date update_date;
}
