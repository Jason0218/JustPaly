package com.dao;

import java.util.List;
import java.util.Map;
import com.pojo.SendNode;

public interface ISendNodeDao {
	//得到全部的sendnode信息
	List<SendNode> getAll();
	
	//增加一个节点
	int insertSendNode(SendNode sendNode);

	//通过配送点id得到一个配送点对象
	SendNode getOne(int id);

	//删除配送点
	void delete(int id);

	//得到全部的配送点并存储在list中
	List<SendNode> getAllDetails();

	//更新配送点
	void update(SendNode sendNode);
	
	//通过配送点中的用户名字段得到一个配送点对象
	SendNode getOneByUsername(String username);

	//通过配送点名得到一个配送点对象
	SendNode getOneByNodename(String nodename);

	//通过上一站点得到一个配送点对象
	SendNode getOneByForwordNode(String forwordNode);

	//得到分页时候的一页面的配送点对象并存储在list中
	List<SendNode> getPartSendNode(Map<String, Integer> map);

	


}
