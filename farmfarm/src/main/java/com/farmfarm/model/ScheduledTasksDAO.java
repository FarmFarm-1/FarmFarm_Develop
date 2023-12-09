package com.farmfarm.model;

import java.util.LinkedHashMap;
import java.util.LinkedList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Repository;

@Repository
public class ScheduledTasksDAO {
	
	@Autowired
	ScheduledTasksService scheduledTasksService;
	
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "com.farmfarm.schedule.";
	
	@Scheduled(cron = "0 0 10 * * *")
	public void cropsDataSave() {
		LinkedList<LinkedHashMap<String, String>> fetchData = scheduledTasksService.cropsQuoteFetch();
		sqlSession.insert(namespace+"cropsDataInsert",fetchData);
	}
	
	
}
