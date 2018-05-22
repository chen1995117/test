/**
 * Project:cxh_first_practice
 * File:LoginController.java
 * Copyright 2004-2018 Homolo Co., Ltd. All rights reserved.
 */
package com.tongdao.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tongdao.service.UserService;


/**
 * @author homolo-89
 * @date 2018年5月4日
 */
@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/visit")
	public String visit() {
		return "package/visit";
	}
	
	@RequestMapping(value= "/login")
	public String login(HttpServletRequest request) {
		String password = request.getParameter("password");
		String userName = request.getParameter("userName");
		if(!password.equals("")&& password!=null &&!userName.equals("") &&userName !=null ) {
			int result = userService.findUser(password, userName);
			if(result==1) {
				return "package/managePackage";
			}
		}
		return "package/error";
	}
}
