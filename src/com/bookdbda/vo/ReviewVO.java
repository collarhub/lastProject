package com.bookdbda.vo;

import java.sql.Date;

public class ReviewVO {
	private String review_id;
	private String title;
	private String member_id;
	private Date regist_date;
	private int click;
	private String book_id;
	private String content;
	private int score;
	public ReviewVO() {
		
	}
	public ReviewVO(String review_id, String title, String member_id, Date regist_date, int click, String book_id,
			String content, int score) {
		super();
		this.review_id = review_id;
		this.title = title;
		this.member_id = member_id;
		this.regist_date = regist_date;
		this.click = click;
		this.book_id = book_id;
		this.content = content;
		this.score = score;
	}
	public String getReview_id() {
		return review_id;
	}
	public void setReview_id(String review_id) {
		this.review_id = review_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Date getRegist_date() {
		return regist_date;
	}
	public void setRegist_date(Date regist_date) {
		this.regist_date = regist_date;
	}
	public int getClick() {
		return click;
	}
	public void setClick(int click) {
		this.click = click;
	}
	public String getBook_id() {
		return book_id;
	}
	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
}
