package com.bookdbda.vo;

import java.util.ArrayList;

public class FavoriteListVO {
	private ArrayList<FavoriteVO> favoriteList;

	public FavoriteListVO() {
		
	}

	public FavoriteListVO(ArrayList<FavoriteVO> favoriteList) {
		this.favoriteList = favoriteList;
	}

	public ArrayList<FavoriteVO> getFavoriteList() {
		return favoriteList;
	}

	public void setFavoriteList(ArrayList<FavoriteVO> favoriteList) {
		this.favoriteList = favoriteList;
	}
	
}
