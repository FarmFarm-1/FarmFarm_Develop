package com.farmfarm.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmfarm.dto.Cultivating_product_detailVO;

@Service
public class UpdateCulService {
	
	@Autowired
	UpdateCulDAO dao;
	
	
	public int updateCultivate(Cultivating_product_detailVO vo) {
		// TODO Auto-generated method stub
		return dao.updateCultivate(vo);
	}
	
	
}
