package com.farmfarm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.farmfarm.dto.TermsOfUseVO;
import com.farmfarm.model.TermOfUseService;

@Controller
public class TermOfUseController {

	@Autowired
	TermOfUseService tService;
	
	@GetMapping(value = "/termContent.do", produces = "text/plain;charset=utf-8")
	public  @ResponseBody  String getTermContent(@RequestParam("termName")  String term_name, Model model) {
		TermsOfUseVO vo =   tService.getTermContent(term_name);
		return vo.getTerm_content() ;
		
	}

}
