package com.farmfarm.model.etc;

import java.util.LinkedHashMap;
import java.util.LinkedList;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	
	Logger logger = LoggerFactory.getLogger(ScheduledTasksDAO.class);
	
	@Scheduled(cron = "0 10 0 * * *")
	public void cropsDataSave() {
		LinkedList<LinkedHashMap<String, String>> fetchData = scheduledTasksService.cropsQuoteDataFetchAndSaveOrNull();
		if(fetchData == null) {
			logger.warn("fetchData is Null");
		} else {
			sqlSession.insert(namespace+"cropsDataInsert",fetchData);
		}
	}
	
}
