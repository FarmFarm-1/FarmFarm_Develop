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
public class Point_historyVO {
	private int point_history_id;
	private String user_serial_num;
	private String history_content;
	private int amount;
	private Date update_date;
	private String product_serial_num;
}
