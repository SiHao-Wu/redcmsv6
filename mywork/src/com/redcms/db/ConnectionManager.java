package com.redcms.db;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ResourceBundle;

import javax.sql.DataSource;

import org.apache.log4j.Logger;

import com.alibaba.druid.pool.DruidDataSource;

public class ConnectionManager 
{
   private static Logger log=Logger.getLogger(ConnectionManager.class);
 
   public static DruidDataSource ds=null;
   private static ThreadLocal<Connection> conpool=new ThreadLocal<Connection>();
   private static ConnectionManager  cm=null;
   
   /**
    * 得到ConnectionManager
    * @return
    */
   public static ConnectionManager newInstance()
   {
	   if(null==cm)
	   {
	   ConnectionManager  cm=new ConnectionManager();
	   cm.init();
	   }
	   
	   return cm;
   }
   /**
    * 初始化连接池
    */
   public static void init()
   {
	    try {
			ResourceBundle res=ResourceBundle.getBundle("jdbc");
			
			ds=new DruidDataSource();
			ds.setUrl(res.getString("url"));
			ds.setDriverClassName(res.getString("driverClassName"));
			ds.setUsername(res.getString("username"));
			ds.setPassword(res.getString("password"));
			ds.setFilters(res.getString("filters"));
			ds.setMaxActive(Integer.parseInt(res.getString("maxActive")));
			ds.setInitialSize(Integer.parseInt(res.getString("initialSize")));
			ds.setMaxWait(Long.parseLong(res.getString("maxWait")));
			ds.setMinIdle(Integer.parseInt(res.getString("minIdle")));
			//ds.setMaxIdle(Integer.parseInt(res.getString("maxIdle")));

			//ds.setTimeBetweenEvictionRunsMillis(Long.parseLong(res.getString("timeBetweenEvictionRunsMillis")));
			//ds.setMinEvictableIdleTimeMillis(Long.parseLong(res.getString("minEvictableIdleTimeMillis")));
			//ds.setValidationQuery(res.getString("validationQuery"));
			
			
		} catch (Exception e) {
			log.error("com.redcms.db.ConnectionManager_ERROR_001_初始化连接池失败");
		} 
   }
   /*
    * 
    * 得到连接对像 
    */
   public static Connection getConnection()
   {
	   Connection con=conpool.get();
	   
			   try {
				if(null==con||con.isClosed())
				   {
					   con=ds.getConnection();
					   conpool.set(con);
				   }
			} catch (SQLException e) {

				   log.error("com.redcms.db.ConnectionManager_ERROR_002_初始化连接池失败");
			}
			   
	   return con;
   }
	
   public static void closeDataSource()
   {
	   if(null!=ds)ds.close();
   }
}
