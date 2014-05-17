package com.common;

/**
 * ��ҳ
 * 
 * @author huijunjie
 * @version 1.0
 */
public class Page {
	// ����������¼
	private int total;

	// ÿҳ��ʾ������
	private int numPerPage = 5;

	// ��ǰ�ڼ�ҳ
	private int curPage = 1;

	// ��ʼ����
	private int beginIndex;

	// ��������
	private int endIndex;

	// ��ҳ��
	private int totalPage;

	/**
	 * ��ȡ��ҳ��
	 * 
	 * @return ��ҳ��
	 */
	public int getTotalPage() {
		if (getTotal() % getNumPerPage() == 0)
			this.totalPage = getTotal() / getNumPerPage();
		else
			this.totalPage = getTotal() / getNumPerPage() + 1;
		return totalPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	/**
	 * ��ȡ��ʼ����
	 * 
	 * @return ��ʼ����
	 */
	public int getBeginIndex() {
		this.beginIndex = (curPage - 1) * numPerPage + 1;
		return beginIndex;
	}

	/**
	 * ��ȡ��������
	 * 
	 * @return ��������
	 */
	public int getEndIndex() {
		this.endIndex = getBeginIndex() + numPerPage - 1;
		return endIndex;
	}
}
