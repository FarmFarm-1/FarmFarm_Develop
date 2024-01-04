package com.farmfarm.model.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.farmfarm.dto.TermsOfUseVO;

@Service
public class TermOfUseService {

	@Autowired
	TermsOfUseDAO dao;
	
	public TermsOfUseVO getTermContent(String term_content) {
		return dao.getTermContent(term_content);
	}
}
