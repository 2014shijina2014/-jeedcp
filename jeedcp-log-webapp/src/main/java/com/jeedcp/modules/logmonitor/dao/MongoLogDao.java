package com.jeedcp.modules.logmonitor.dao;


import com.jeedcp.common.persistence.Pagination;
import com.jeedcp.modules.logmonitor.dto.MongoLogDto;
import com.jeedcp.modules.logmonitor.entity.MongoLog;
import com.jeedcp.common.persistence.CrudMongoDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Jeedcp on 15/9/9.
 */
@Component
public class MongoLogDao extends CrudMongoDao {

    @Autowired
    MongoTemplate paasLogsTemplate;


    public List<MongoLog> findMongoLogByDto(MongoLogDto mongoLogDto){
        Query query = new Query();
        if(mongoLogDto != null) {
            if (mongoLogDto.getLevel() != null){
                query.addCriteria(Criteria.where("level").is(mongoLogDto.getLevel()));
            }
            if(mongoLogDto.getIp() != null){
                query.addCriteria(Criteria.where("host.ip").is(mongoLogDto.getIp()));
            }
            if(mongoLogDto.getStartDate()!=null && mongoLogDto.getEndDate()!=null){
//                query.addCriteria(Criteria.where("timestamp").gte(mongoLogDto.getEndDate()).lte(mongoLogDto.getStartDate()));
                query.addCriteria(Criteria.where("timestamp").lte(mongoLogDto.getEndDate()).gte(mongoLogDto.getStartDate()));
            }
            List<MongoLog> mongoLogList = paasLogsTemplate.find(query, MongoLog.class);
            return mongoLogList;
        }
        return null;
    }

    public Pagination<MongoLog> findMongoLogePageByDto(MongoLogDto mongoLogDto){
        Query query = new Query();
        if(mongoLogDto != null) {
            if (mongoLogDto.getLevel() != null){
                query.addCriteria(Criteria.where("level").is(mongoLogDto.getLevel()));
            }
            if(mongoLogDto.getIp() != null){
                query.addCriteria(Criteria.where("host.ip").is(mongoLogDto.getIp()));
            }
            if(mongoLogDto.getStartDate()!=null && mongoLogDto.getEndDate()!=null){
//                query.addCriteria(Criteria.where("timestamp").gte(mongoLogDto.getEndDate()).lte(mongoLogDto.getStartDate()));
                query.addCriteria(Criteria.where("timestamp").lte(mongoLogDto.getEndDate()).gte(mongoLogDto.getStartDate()));
            }

//            Pagination<MongoLog> pagination = new Pagination<MongoLog>(mongoLogDto.getPageNum(),mongoLogDto.getPageSize());
            Pagination<MongoLog> pagination = new Pagination(new ArrayList<MongoLog>());
//            query.skip(pagination.getStartRow());
//            pagination
            List<MongoLog> mongoLogList = paasLogsTemplate.find(query, MongoLog.class);


        }
        return null;
    }
}
