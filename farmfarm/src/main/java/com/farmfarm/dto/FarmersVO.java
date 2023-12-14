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
public class FarmersVO {
	String farmer_serial_num;
	String farmer_email;
	String farmer_pw;
	String farmer_name;
	Date farmer_join_date;
}



