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
public class Auction_historyVO {
	int auction_serial_num;
	String product_serial_num;
	String user_serial_num;
	int user_price;
	Date bid_date;
	String auction_status;
}
