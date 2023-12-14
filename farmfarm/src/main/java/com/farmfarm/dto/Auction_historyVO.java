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
	private int auction_serial_num;
	private String product_serial_num;
	private String user_serial_num;
	private int user_price;
	private Date bid_date;
	private String auction_status;
}
