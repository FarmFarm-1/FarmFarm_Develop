package com.farmfarm.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmfarm.dto.FarmersVO;

@Service
public class FarmerService {
	
	@Autowired
	FarmerDAO dao;
	
	public FarmersVO loginFarmer(FarmersVO vo) {
		return dao.loginFarmer(vo);
	}
	
	public int testInsert(FarmersVO vo) {
		return dao.farmerInsert(vo);
	}

	public List<FarmersVO> getAllFarmers() {
		return dao.getAllFarmers();
	}
	
}
