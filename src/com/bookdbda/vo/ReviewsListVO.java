package com.bookdbda.vo;

public class ReviewsListVO {
	private int pageNo;
	private int pageSize;
	private int totalCount;
	private ReviewListVO reviewList;
	public ReviewsListVO() {
		
	}
	public ReviewsListVO(int pageNo, int pageSize, int totalCount, ReviewListVO reviewList) {
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.reviewList = reviewList;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public ReviewListVO getReviewList() {
		return reviewList;
	}
	public void setReviewList(ReviewListVO reviewList) {
		this.reviewList = reviewList;
	}
}
