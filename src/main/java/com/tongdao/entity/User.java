/**
 * Project:cxh_first_practice
 * File:User.java
 * Copyright 2004-2018 Homolo Co., Ltd. All rights reserved.
 */
package com.tongdao.entity;

import java.io.Serializable;

/**
 * @author homolo-89
 * @date 2018年5月4日
 */
public class User implements Serializable{

	private static final long serialVersionUID = 1L;
	
	public int userId;//用户ID
	public String password;//登录密码
	public String userName;//登录帐号
	public  User() {
	}
	public  User(String password,String userName) {
		this.password = password;
		this.userName = userName;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", password=" + password + ", userName=" + userName + "]";
	}
	
	
}
