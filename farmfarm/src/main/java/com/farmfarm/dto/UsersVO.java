package com.farmfarm.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor*/
@Data
public class UsersVO {
	String user_serial_num;
	String user_email;
	String user_pw;
	String user_name;
	int user_point;
	Date user_join_date; 
}
