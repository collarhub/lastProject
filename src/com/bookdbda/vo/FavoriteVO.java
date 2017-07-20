package com.bookdbda.vo;

public class FavoriteVO {
	private String member_id;
	private String book_id;
	public FavoriteVO() {
		
	}
	public FavoriteVO(String member_id, String book_id) {
		super();
		this.member_id = member_id;
		this.book_id = book_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getBook_id() {
		return book_id;
	}
	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}
	
}
