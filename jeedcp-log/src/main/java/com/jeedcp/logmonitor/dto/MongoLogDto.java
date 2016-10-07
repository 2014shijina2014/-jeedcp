package com.jeedcp.logmonitor.dto;


import com.jeedcp.common.dto.BaseMongoDto;

import java.util.Date;

/**
 * Created by Zach on 15/9/9.
 */
public class MongoLogDto extends BaseMongoDto {

    private String level;
    private Date startDate;
    private Date endDate;
    private String ip;

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }
}
