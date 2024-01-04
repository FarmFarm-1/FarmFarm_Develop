package com.farmfarm.model.auction;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmfarm.dto.Crops_quoteVO;

@Service
public class ChartService {
	
	@Autowired
	ChartDAO chartDAO;

	public List<Crops_quoteVO> cropsInfoByKind(String crops_kind) {
		return chartDAO.cropsInfoByKind(crops_kind);
	}

	public int cropsPriceAvg(String crops_kind) {
		return chartDAO.cropsPriceAvg(crops_kind);
	}
	
	public String cropQuoteDate() {
		return chartDAO.cropQuoteDate();
	}
	
	public List<Map<String, Object>> cropQuoteList() {
		return chartDAO.cropQuoteList();
	}
	
}
