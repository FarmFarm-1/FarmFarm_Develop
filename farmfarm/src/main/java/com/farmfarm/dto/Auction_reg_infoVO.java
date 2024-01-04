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
public class Auction_reg_infoVO{
	String product_serial_num;
	int harvest_amount;
	int starting_price;
	Date auction_deadline; 
	Date auction_regdate;
}
