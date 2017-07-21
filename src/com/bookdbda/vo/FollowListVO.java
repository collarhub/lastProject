package com.bookdbda.vo;

import java.util.ArrayList;

public class FollowListVO {
	private ArrayList<FollowVO> followList;

	public FollowListVO() {
		
	}

	public FollowListVO(ArrayList<FollowVO> followList) {
		this.followList = followList;
	}

	public ArrayList<FollowVO> getFollowList() {
		return followList;
	}

	public void setFollowList(ArrayList<FollowVO> followList) {
		this.followList = followList;
	}
	
}
