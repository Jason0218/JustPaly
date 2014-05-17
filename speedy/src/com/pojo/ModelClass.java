package com.pojo;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * 所有实体类的父类，复写toString、equals、hashCode方法
 */
public class ModelClass implements java.io.Serializable{
	/**
	 */
	private static final long serialVersionUID = -3485930893800259034L;
	
	private int id;

	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (((Integer)id == null) ? 0 : ((Integer)id).hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ModelClass other = (ModelClass) obj;
		if ((Integer)id == null) {
			if (((Integer)other.id) != null)
				return false;
		} else if (!((Integer)id).equals((Integer)other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		Method[] methods = getClass().getMethods();
		StringBuilder sb = new StringBuilder(getClass().getName() + " [");
		for (Method method : methods) {
			String s = method.getName();
			if (s.startsWith("get") && !s.equals("getClass")) {
				try {
					sb.append(s.substring(3));
					sb.append(" = ");
					sb.append(method.invoke(this));
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					e.printStackTrace();
				}
				sb.append(", ");
			}
		}
		String str = sb.toString();
		str = str.substring(0, str.length() - 2);
		str += "]";
		return str;
	}
	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	
	

}
