package com.farmfarm.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.farmfarm.dto.FarmersVO;
import com.farmfarm.dto.UsersVO;

@Repository
public class FarmerDAO {
	
	@Autowired
	SqlSession sqlSession;
	String namespace = "com.farmfarm.FarmersVO.";
	
	public FarmersVO loginFarmer(FarmersVO vo) {
		return sqlSession.selectOne(namespace+"loginFarmer",vo);
	}
	
	public int farmerInsert(FarmersVO vo) {
		int result =0;
		result = sqlSession.insert(namespace+"farmerInsert",vo);
		return result;
	}

	public List<FarmersVO> getAllFarmers() {
		return sqlSession.selectList(namespace+"getAllFarmers");
	}

}
