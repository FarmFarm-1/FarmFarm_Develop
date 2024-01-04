package com.farmfarm.controller.main;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.farmfarm.dto.Crops_quoteVO;
import com.farmfarm.model.auction.ChartService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/chart")
public class ChartController {
	
	@Autowired
	ChartService chartService;
	
	@GetMapping("/area/{crops_kind}")
	public String showChart(@PathVariable("crops_kind") String crops_kind, Model model) {
		List<Crops_quoteVO> cropsInfo= chartService.cropsInfoByKind(crops_kind);
		int cropspriceAvg = chartService.cropsPriceAvg(crops_kind);
		model.addAttribute("cropspriceAvg",cropspriceAvg);
		model.addAttribute("crops_kind", cropsInfo.get(0).getCrops_kind());
	
		List<Integer> priceList = new ArrayList<>();
		List<String> dateList = new ArrayList<>();
		for(Crops_quoteVO vo:chartService.cropsInfoByKind(crops_kind)) {
			priceList.add(vo.getCrops_quote());
			dateList.add(vo.getRegDate().toString());
		}
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			String jsonPriceList = objectMapper.writeValueAsString(priceList);
			String jsonDateList = objectMapper.writeValueAsString(dateList);
			model.addAttribute("priceList",jsonPriceList);
			model.addAttribute("dateList",jsonDateList);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "chart/areaChart";
		
	}

}
