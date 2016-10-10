package com.jeedcp.modules.logmonitor.entity;

import com.jeedcp.common.persistence.BaseMongoEntity;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
 * Created by Zach on 15/9/8.
 */
@Repository
@Document(collection="log")
public class MongoLog extends BaseMongoEntity {

    private Date timestamp;
    private String level;
    private String thread;
    private String message;
    private LoggerName loggerName;
    private String fileName;
    private String method;
    private Integer lineNumber;
    @Field("class")
    private Clazz clazz;
    private Host host;


    @Override
    public String toString() {
        return "Log{" +
                "timestamp=" + timestamp +
                ", level='" + level + '\'' +
                ", thread='" + thread + '\'' +
                ", message='" + message + '\'' +
                ", loggerName=" + loggerName +
                ", fileName='" + fileName + '\'' +
                ", method='" + method + '\'' +
                ", lineNumber=" + lineNumber +
                ", clazz=" + clazz +
                ", host=" + host +
                '}';
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getThread() {
        return thread;
    }

    public void setThread(String thread) {
        this.thread = thread;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public LoggerName getLoggerName() {
        return loggerName;
    }

    public void setLoggerName(LoggerName loggerName) {
        this.loggerName = loggerName;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public Integer getLineNumber() {
        return lineNumber;
    }

    public void setLineNumber(Integer lineNumber) {
        this.lineNumber = lineNumber;
    }

    public Clazz getClazz() {
        return clazz;
    }

    public void setClazz(Clazz clazz) {
        this.clazz = clazz;
    }

    public Host getHost() {
        return host;
    }

    public void setHost(Host host) {
        this.host = host;
    }
}

class LoggerName{
    private String fullyQualifiedClassName;
    @Field("package")
    private List<String> packagee;
    private String className;

    @Override
    public String toString() {
        return "LoggerName{" +
                "fullyQualifiedClassName='" + fullyQualifiedClassName + '\'' +
                ", packagee=" + packagee +
                ", className='" + className + '\'' +
                '}';
    }

    public String getFullyQualifiedClassName() {
        return fullyQualifiedClassName;
    }

    public void setFullyQualifiedClassName(String fullyQualifiedClassName) {
        this.fullyQualifiedClassName = fullyQualifiedClassName;
    }

    public List<String> getPackagee() {
        return packagee;
    }

    public void setPackagee(List<String> packagee) {
        this.packagee = packagee;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }
}

class Clazz{
    private String fullyQualifiedClassName;
    @Field("package")
    private List<String> packagee;
    private String className;

    @Override
    public String toString() {
        return "Clazz{" +
                "fullyQualifiedClassName='" + fullyQualifiedClassName + '\'' +
                ", packagee=" + packagee +
                ", className='" + className + '\'' +
                '}';
    }

    public String getFullyQualifiedClassName() {
        return fullyQualifiedClassName;
    }

    public void setFullyQualifiedClassName(String fullyQualifiedClassName) {
        this.fullyQualifiedClassName = fullyQualifiedClassName;
    }

    public List<String> getPackagee() {
        return packagee;
    }

    public void setPackagee(List<String> packagee) {
        this.packagee = packagee;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }
}

class Host{
    private String process;
    private String name;
    private String ip;

    @Override
    public String toString() {
        return "Host{" +
                "process='" + process + '\'' +
                ", name='" + name + '\'' +
                ", ip='" + ip + '\'' +
                '}';
    }

    public String getProcess() {
        return process;
    }

    public void setProcess(String process) {
        this.process = process;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }
}
