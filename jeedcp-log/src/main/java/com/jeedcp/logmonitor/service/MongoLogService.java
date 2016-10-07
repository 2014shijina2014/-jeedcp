package com.jeedcp.logmonitor.service;


import com.jeedcp.logmonitor.dao.MongoLogDao;
import com.jeedcp.logmonitor.dto.MongoLogDto;
import com.jeedcp.logmonitor.entity.MongoLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Zach on 15/9/9.
 */
@Service
public class MongoLogService {

    @Autowired
    MongoLogDao mongoLogDao;

    public List<MongoLog> findMongoLogByDto(MongoLogDto mongoLogDto){
        return mongoLogDao.findMongoLogByDto(mongoLogDto);
    }


}
