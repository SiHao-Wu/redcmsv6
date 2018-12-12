package com.redcms.db;

import java.sql.SQLException;

import org.apache.commons.dbutils.handlers.BeanHandler;



public class Test {

	public static void main(String[] args) throws SQLException 
	{
		
		try {
			Db.beginTransaction();
			Db.update("insert into t1(f1,f2) values(?,?)", "fff81",10);
			Db.update("insert into t2(f1,f2) values(?,?)", "ddd81",20);
			Db.commitTransaction();
		} catch (Exception e) {
		    Db.rollbackTransaction();
			e.printStackTrace();
		}
		
	}

}
