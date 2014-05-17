package com.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.dao.ISendNodeDao;
import com.pojo.SendNode;
import com.service.ISendNodeService;

public class SendNodeServiceImpl implements ISendNodeService{
	ISendNodeDao snd;
	SendNode sendNode;
	List<SendNode> allList=new ArrayList<SendNode>();
	public SendNode getSendNode() {
		return sendNode;
	}
	public void setSendNode(SendNode sendNode) {
		this.sendNode = sendNode;
	}
	public ISendNodeDao getSnd() {
		return snd;
	}
	public void setSnd(ISendNodeDao snd) {
		this.snd = snd;
	}
	public void setAllList(List<SendNode> allList) {
		this.allList = allList;
	}
	public List<SendNode> getAllList() {
		
		return allList;
	}
	
	@Override
	public List<SendNode> getAll() {

		// TODO Auto-generated method stub
		allList=snd.getAll();
		return allList;
	}
	@Override
	public int insertSendNode(SendNode sendNode) {
		// TODO Auto-generated method stub
		snd.insertSendNode(sendNode);
		return 0;
	}
	@Override
	public SendNode getOne(int id) {
		// TODO Auto-generated method stub
		sendNode=snd.getOne(id);
		return sendNode;
	}
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		snd.delete(id);
	}
	@Override
	public List<SendNode> getAllDetails() {
		// TODO Auto-generated method stub
		allList=snd.getAllDetails();
		return allList;
	}
	@Override
	public void update(SendNode sendNode,int id) {
		// TODO Auto-generated method stub
		snd.update(sendNode);
	}
	@Override
	public SendNode getOneByUsername(String username) {
		// TODO Auto-generated method stub
		sendNode=snd.getOneByUsername(username);
		return sendNode;
	}
	@Override
	public SendNode getOneByNodename(String nodename) {
		// TODO Auto-generated method stub
		sendNode=snd.getOneByNodename(nodename);
		return sendNode;
	}
	@Override
	public int getTotal() {
		// TODO Auto-generated method stub
		allList=snd.getAll();
		return allList.size();
	
	}
	@Override
	public List<SendNode> getPartSendNode(Map map) {
		// TODO Auto-generated method stub
		return snd.getPartSendNode(map);
	}



	
	
}
