package com.bookdbda.vo;

import java.util.Date;

public class MemberVO {
	private String member_id;
	private String password;
	private	String nickname;
	private String email;
	private Date birth_date;
	private String phone;
	private String addr;
	private String photo;
	private int rank;
	
	public MemberVO() {
		
	}

	public MemberVO(String member_id, String password, String nickname, String email, Date birth_date, String phone,
			String addr, String photo, int rank) {
		super();
		this.member_id = member_id;
		this.password = password;
		this.nickname = nickname;
		this.email = email;
		this.birth_date = birth_date;
		this.phone = phone;
		this.addr = addr;
		this.photo = photo;
		this.rank = rank;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getBirth_date() {
		return birth_date;
	}

	public void setBirth_date(Date birth_date) {
		this.birth_date = birth_date;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}
	
}
