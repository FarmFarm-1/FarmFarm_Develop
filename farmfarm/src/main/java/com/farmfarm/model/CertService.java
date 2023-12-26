package com.farmfarm.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CertService {
	
	@Autowired
	CertDAO dao;
	
	public String cert(String uid) {
		// TODO Auto-generated method stub
		return dao.cert(uid);
	}

	

}
