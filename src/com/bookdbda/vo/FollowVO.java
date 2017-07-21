package com.bookdbda.vo;

public class FollowVO {
	private String member_id;
	private String follower_id;
	public FollowVO() {
		
	}
	public FollowVO(String member_id, String follower_id) {
		super();
		this.member_id = member_id;
		this.follower_id = follower_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getFollower_id() {
		return follower_id;
	}
	public void setFollower_id(String follower_id) {
		this.follower_id = follower_id;
	}
	
}
