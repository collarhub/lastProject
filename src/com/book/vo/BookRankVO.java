package com.book.vo;

public class BookRankVO {
	private String isbn;
	private String title;
	private int goodpoint;
	
	public BookRankVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BookRankVO(String isbn, String title, int goodpoint) {
		super();
		this.isbn = isbn;
		this.title = title;
		this.goodpoint = goodpoint;
	}
	
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getGoodpoint() {
		return goodpoint;
	}
	public void setGoodpoint(int goodpoint) {
		this.goodpoint = goodpoint;
	}
}
