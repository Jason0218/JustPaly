package com.util;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
/**
 * @author Hang
 *
 */
public class SpringUtils {
	private static ApplicationContext context = null;
	
	@SuppressWarnings("unchecked")
	public static <T> T getBean(String name) {
		if (context == null) {
			synchronized (SpringUtils.class) {
				if (context == null) {
					 context = new ClassPathXmlApplicationContext("beans.xml");
				}
			}
		}
		return (T) context.getBean(name);
	}
}
