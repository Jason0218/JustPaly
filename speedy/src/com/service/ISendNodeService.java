package com.service;

import java.util.List;
import java.util.Map;

import com.pojo.SendNode;

public interface ISendNodeService {
	//得到全部的配送点信息
	List<SendNode> getAll();

	

	int insertSendNode(SendNode sendNode);



	SendNode getOne(int id);



	void delete(int id);



	List<SendNode> getAllDetails();



	void update(SendNode sendNode,int id);
	
	SendNode getOneByUsername(String username);



	SendNode getOneByNodename(String nodename);


	//得到全部数据库中t_sendNode的全部记录数目
	int getTotal();



	List<SendNode> getPartSendNode(Map map);
		
	
}
