package com.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dao.ISendNodeDao;
import com.pojo.SendNode;

public class SendNodeImpl implements ISendNodeDao{
	SqlSession sqlSession;
	SendNode sn;
	List<SendNode> lists;
	
	
	public SendNode getSn() {
		return sn;
	}

	public void setSn(SendNode sn) {
		this.sn = sn;
	}

	public List getLists() {
		return lists;
	}

	public void setLists(List lists) {
		this.lists = lists;
	}

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	/**
	 * 閹垫儳鍩岄幍锟芥箒闁板秹锟介悙閫涗繆閹拷
	 */
	@Override
	public List<SendNode> getAll() {
		// TODO Auto-generated method stub
		List<SendNode> lists=sqlSession.selectList("select_getAll");
		return lists;
		
	}
	/**
	 * 瀵版鍩岄幍锟芥箒闁板秹锟介悙鍦畱閸忋劑鍎存穱鈩冧紖
	 */
	@Override
	public List<SendNode> getAllDetails() {
		// TODO Auto-generated method stub
		List<SendNode> lists=sqlSession.selectList("select_getAll");
		/*for (int i = 0; i < lists.size(); i++) {
			System.out.println(lists.get(i).getNodename());
		}*/
		return lists;
	}
	/**
	 * 閹绘帒鍙嗛柊宥夛拷閻愶拷
	 */
	@Override
	public int insertSendNode(SendNode sendNode) {
		// TODO Auto-generated method stub
		sqlSession.insert("insertSendNode",sendNode);
			return 0;
	}
/**
 * 瀵版鍩屾稉锟芥蒋闁板秹锟介悙閫涗繆閹拷
 */
	@Override
	public SendNode getOne(int id) {
		// TODO Auto-generated method stub
	//	System.out.println(id);
		return sqlSession.selectOne("selectSendNode_by_id", id);
	}
	
	/**
	 * 閹稿鍙巙sername瀵版鍩屾稉锟芥蒋娣団剝浼�
	 */
	public SendNode getOneByUsername(String username){

		return sqlSession.selectOne("selectOnebyUsername", username);
	}
/**
 * 閸掔娀娅庨柊宥夛拷閻愶拷
 */
	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		sqlSession.delete("deleteSendNode", id);
	}
/**
 * 娣囶喗鏁奸柊宥夛拷閻愶拷
 */
	@Override
	public void update(SendNode sendNode) {
		// TODO Auto-generated method stub
		sqlSession.update("updateSendNode",sendNode);
	}

@Override
public SendNode getOneByNodename(String nodename) {
	// TODO Auto-generated method stub

		SendNode sendNode=	sqlSession.selectOne("selectOnebyNodename",nodename);

		return sendNode;
}


@Override
public SendNode getOneByForwordNode(String forwordNode) {
	SendNode sendNode=sqlSession.selectOne("selectbyForwordNode",forwordNode);
	return sendNode;
}

@Override
public List<SendNode> getPartSendNode(Map map) {
	// TODO Auto-generated method stub
	return sqlSession.selectList("selectByStartAndEnd",map);

}





}

