package com.farmfarm.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmfarm.dto.Auction_reg_infoVO;
import com.farmfarm.dto.Farm_and_productVO;
import com.farmfarm.dto.Funding_reg_infoVO;

@Service
public class regProService {

	@Autowired
	regProDAO dao;

	public int regPro(Farm_and_productVO vo, Funding_reg_infoVO fundVO) {
		return dao.regPro(vo, fundVO);
	}

	public int regAuc(Farm_and_productVO vo, Auction_reg_infoVO aucVO) {
		// TODO Auto-generated method stub
		return dao.regAuc(vo,aucVO);
	}
	
}
