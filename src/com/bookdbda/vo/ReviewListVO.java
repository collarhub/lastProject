package com.bookdbda.vo;

import java.util.ArrayList;

public class ReviewListVO {
	private ArrayList<ReviewVO> reviewList;

	public ReviewListVO() {
		
	}

	public ReviewListVO(ArrayList<ReviewVO> reviewList) {
		this.reviewList = reviewList;
	}

	public ArrayList<ReviewVO> getReviewList() {
		return reviewList;
	}

	public void setReviewList(ArrayList<ReviewVO> reviewList) {
		this.reviewList = reviewList;
	}
	
}
