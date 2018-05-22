/**
 * Project:cxh_first_practice
 * File:UserDao.java
 * Copyright 2004-2018 Homolo Co., Ltd. All rights reserved.
 */
package com.tongdao.dao;

import org.springframework.stereotype.Repository;

/**
 * @author homolo-89
 * @date 2018年5月4日
 */
@Repository("userDao")
public interface UserDao {
	public int findUser(String password,String userName);
}
