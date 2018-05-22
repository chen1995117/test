package com.tongdao.entity;

import java.io.Serializable;

public class PictureInformation implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer id ;
	private String picture;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	@Override
	public String toString() {
		return "PictureInformation [id=" + id + ", picture=" + picture + "]";
	}
	
}
