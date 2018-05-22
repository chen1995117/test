/**
 * Project:cxh_first_practice
 * File:UserServiceImpl.java
 * Copyright 2004-2018 Homolo Co., Ltd. All rights reserved.
 */
package com.tongdao.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tongdao.dao.UserDao;
import com.tongdao.service.UserService;

/**
 * @author homolo-89
 * @date 2018年5月4日
 */
@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;
	public int findUser(String password, String userName) {
		
		return userDao.findUser(password, userName);
	}
	
}
