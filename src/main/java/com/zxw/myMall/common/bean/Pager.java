package com.zxw.myMall.common.bean;

public class Pager {

    private int     pageIndex = 1;
    private int     pageLimit = 10;
    private int     rowStart;
    private int     rowCount;
    private boolean pageOn    = false;
    private String  orderby;

    public int getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    public int getPageLimit() {
        return pageLimit;
    }

    public void setPageLimit(int pageLimit) {
        this.pageLimit = pageLimit;
    }

    public int getRowStart() {
        rowStart = (pageIndex - 1) * pageLimit;
        return rowStart;
    }

    public void setRowStart(int rowStart) {
        this.rowStart = rowStart;
    }

    public int getRowCount() {
        return rowCount;
    }

    public void setRowCount(int rowCount) {
        this.rowCount = rowCount;
    }

    public boolean isPageOn() {
        return pageOn;
    }

    public void setPageOn(boolean pageOn) {
        this.pageOn = pageOn;
    }

    public String getOrderby() {
        return orderby;
    }

    public void setOrderby(String orderby) {
        this.orderby = orderby;
    }

	@Override
	public String toString() {
		return "Pager [pageIndex=" + pageIndex + ", pageLimit=" + pageLimit + ", rowStart=" + rowStart + ", rowCount="
				+ rowCount + ", pageOn=" + pageOn + ", orderby=" + orderby + "]";
	}

}
