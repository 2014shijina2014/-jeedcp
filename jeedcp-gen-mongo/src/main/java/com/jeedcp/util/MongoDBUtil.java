package com.jeedcp.util;

import java.net.UnknownHostException;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Set;

import cn.org.rapid_framework.generator.provider.db.table.model.Column;

import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;

public class MongoDBUtil {
	public static LinkedHashSet<Column> client(String dbStr,String collection) throws UnknownHostException{
		MongoClient mongoClient = new MongoClient("192.168.1.139", 27017);
		DB db = mongoClient.getDB(dbStr);
//		Set<String> set =db.getCollectionNames();
		
//		Iterator<String> collectionName=set.iterator();
		DBCollection dbCollection =db.getCollection(collection);
//		DBCursor dbCursor= dbCollection.find().limit(1);
//		DBObject dbobject=dbCursor.getKeysWanted();
//		Set<String> keys= dbobject.keySet();
		
		
		DBObject dbObject=dbCollection.findOne();
		Set<String> keys=  dbObject.keySet();
		Iterator<String> keysSet=keys.iterator();
		LinkedHashSet<Column> columns=new LinkedHashSet<Column>();
		Column id = new Column(null,1,"_id","id",20,1,true,false,false,false,null,null);
		id.setJavaType("java.lang.String");
		columns.add(id);
		while(keysSet.hasNext()) {
			String str = (String) keysSet.next();
			if("_id".equals(str)|| "_class".equals(str)){
				continue;
			}
			System.out.println(str+"--->"+dbObject.get(str).getClass().getName());
//			System.out.println(dbObject.get(str).getClass().getPackage());
//			System.out.println(dbObject.get(str).getClass().getName());
			Column column = new Column(null,1,str,str,20,1,false,false,false,false,null,null);
			column.setJavaType(dbObject.get(str).getClass().getName());
			columns.add(column);
		}
		return columns;
//		while (collectionName.hasNext()) {
//			String str = (String) collectionName.next();
//			System.out.println(str);
//			DBCollection dbCollection=db.getCollection(str);
//		}
		
	}
	
	
	public static void main(String[] args) throws UnknownHostException {
		client("pm-core","OPERATOR");
	}
}
