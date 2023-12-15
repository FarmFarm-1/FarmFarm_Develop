package com.farmfarm.model;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;

@Configuration
@PropertySource("classpath:aws.properties")
public class S3Config {

	//@Value("${aws.accesskey}")
	private String accessKey = "AKIATLB4HTHPMUOPD3OR";

	//@Value("${aws.secretkey}")
	private String secretKey = "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";

	//@Value("${aws.region.static}")
	private String region = "ap-northeast-2";

	@Bean
	public AmazonS3 amazonS3Client() {
		BasicAWSCredentials awsCredentials = new BasicAWSCredentials(this.accessKey, this.secretKey);
		return AmazonS3ClientBuilder.standard().withRegion(Regions.fromName(region))
				.withCredentials(new AWSStaticCredentialsProvider(awsCredentials)).build();
	}
}
