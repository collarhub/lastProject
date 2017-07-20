package com.book.member;

public class MemberVO {
	private String member_id;
	private String password;
	private String nickname;
	private String email;
	private String birth_date;
	private String phone;
	private String addr;
	private String photo;
	private String rank;
	public MemberVO(String member_id, String password, String nickname, String email, String birth_date, String phone,
			String addr, String photo, String rank) {
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
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
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
	public String getBirth_date() {
		return birth_date;
	}
	public void setBirth_date(String birth_date) {
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
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	@Override
	public String toString() {
		return "MemberVO [member_id=" + member_id + ", password=" + password + ", nickname=" + nickname + ", email="
				+ email + ", birth_date=" + birth_date + ", phone=" + phone + ", addr=" + addr + ", photo=" + photo
				+ ", rank=" + rank + "]";
	}
}
