package com.util;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
/**
 * mybatis的工具类，用于测试！
 * 但首先的在mybatis的配置文件中配置链接数据库的环境�?
 *
 */
public class MyBatisUtils {
	private static SqlSessionFactory factory;
	
	private static ThreadLocal<SqlSession> threadLocal = new ThreadLocal<SqlSession>();
	
	public static SqlSessionFactory getSqlSessionFactory() {
		if (factory == null) {
			synchronized (MyBatisUtils.class) {
				if (factory == null) {
					builderSessionFactory();
				}
			}
		}
		return factory;
	}
	
	public static SqlSession getSqlSession() {
		SqlSession session = threadLocal.get();
		if (session == null) {
			session = getSqlSessionFactory().openSession();
			threadLocal.set(session);
		}
		return session;
	}
	
	public static void closeSesison() {
		SqlSession session = threadLocal.get();
		if (session != null) {
			session.close();
		}
	}
	
	public static void builderSessionFactory() {
		Reader reader = null;
		try {
			reader = Resources.getResourceAsReader("mybatis-config.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
