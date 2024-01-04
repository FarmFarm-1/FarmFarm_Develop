package com.farmfarm.model.farmer;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.farmfarm.dto.Cultivating_product_detailVO;

@Repository
public class UpdateCulDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	String namespace ="com.farmfarm.updateCul.";

	public int updateCultivate(Cultivating_product_detailVO vo) {
		int res = sqlSession.insert(namespace + "updateCultivate",vo);
		return res;
	}

}
