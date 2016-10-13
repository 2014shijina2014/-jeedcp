package com.jeedcp.modules.logmonitor.service;


import com.jeedcp.modules.logmonitor.dao.MongoLogDao;
import com.jeedcp.modules.logmonitor.dto.MongoLogDto;
import com.jeedcp.modules.logmonitor.entity.MongoLog;
import com.jeedcp.modules.logmonitor.entity.MongoLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Jeedcp on 15/9/9.
 */
@Service
public class MongoLogService {

    @Autowired
    MongoLogDao mongoLogDao;

    public List<MongoLog> findMongoLogByDto(MongoLogDto mongoLogDto){
        return mongoLogDao.findMongoLogByDto(mongoLogDto);
    }


}
