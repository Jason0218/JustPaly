package com.common;

/**
 * 分页
 * 
 * @author huijunjie
 * @version 1.0
 */
public class Page {
	// 共多少条记录
	private int total;

	// 每页显示多少行
	private int numPerPage = 5;

	// 当前第几页
	private int curPage = 1;

	// 起始索引
	private int beginIndex;

	// 结束索引
	private int endIndex;

	// 总页数
	private int totalPage;

	/**
	 * 获取总页数
	 * 
	 * @return 总页数
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
	 * 获取起始索引
	 * 
	 * @return 起始索引
	 */
	public int getBeginIndex() {
		this.beginIndex = (curPage - 1) * numPerPage + 1;
		return beginIndex;
	}

	/**
	 * 获取结束索引
	 * 
	 * @return 结束索引
	 */
	public int getEndIndex() {
		this.endIndex = getBeginIndex() + numPerPage - 1;
		return endIndex;
	}
}
