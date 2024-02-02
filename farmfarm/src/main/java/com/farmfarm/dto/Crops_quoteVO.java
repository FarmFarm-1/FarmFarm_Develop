package com.farmfarm.dto;

import java.sql.Date;

import lombok.Getter;

@Getter
public class Crops_quoteVO {
	int crops_quote_serial_num;
	String crops_kind;
	int crops_quote;
	Date regDate;
	Date insertdate;
}
