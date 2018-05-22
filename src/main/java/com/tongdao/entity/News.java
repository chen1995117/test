/**
 * Project:cxh_first_practice
 * File:News.java
 * Copyright 2004-2018 Homolo Co., Ltd. All rights reserved.
 */
package com.tongdao.entity;

import java.io.Serializable;

/**
 * @author homolo-89
 * @date 2018年5月2日
 */
public class News implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Long id ; //ID
	private String context ; //内容
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	
	@Override
	public String toString() {
		return "News [id=" + id + ", context=" + context + "]";
	}
	
}
