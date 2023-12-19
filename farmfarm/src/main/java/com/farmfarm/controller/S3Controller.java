package com.farmfarm.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.farmfarm.model.S3Service;


@Controller
@RequestMapping("/s3")
public class S3Controller {
	
	@Autowired
	S3Service s3Service;
	
	@GetMapping("/test")
	public String showTest() {
		return "testImage";
	}
	
	@PostMapping("/upload")
	@ResponseBody
	public String upload(MultipartFile file, HttpServletResponse resp) {
		String url = s3Service.uploadFile(file);
		System.out.println(url);
		return url;
	}
	
	
	

}
