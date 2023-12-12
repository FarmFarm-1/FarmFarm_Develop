package com.farmfarm.dto;

import java.sql.Date;

import lombok.Data;

/*@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor*/
@Data
public class FarmersVO {
	String farmer_serial_num;
	String farmer_email;
	String farmer_pw;
	String farmer_name;
	Date farmer_join_date; 
}
