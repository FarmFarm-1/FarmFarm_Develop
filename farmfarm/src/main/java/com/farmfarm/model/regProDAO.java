package com.farmfarm.model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.farmfarm.dto.Farm_and_productVO;
import com.farmfarm.dto.Funding_reg_infoVO;

@Repository
public class regProDAO {

	@Autowired
	SqlSession sqlSession;
	
	String namespace = "com.farmfarm.RegProduct.";

	@Transactional
	public int regPro(Farm_and_productVO vo, Funding_reg_infoVO fundVO) {
		sqlSession.insert(namespace + "regPro",vo);
		
		String serial = sqlSession.selectOne(namespace+"getLastInsertedId");
		fundVO.setProduct_serial_num(serial);
		
		int res = sqlSession.insert(namespace + "regFundInfo",fundVO); 
		
		
		return res;
	}
	
	
}
