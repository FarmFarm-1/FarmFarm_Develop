package com.farmfarm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ExceptionTestController {
	
	@RequestMapping("/exceptionTest")
	public void exceptionTest() throws Exception {
		
		throw new Exception("Exception Tests!!!!!!!!!!!!!!!!!!!!!!!!!!!");
	}
}
