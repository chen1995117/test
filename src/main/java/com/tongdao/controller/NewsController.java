/**
 * Project:cxh_first_practice
 * File:newsController.java
 * Copyright 2004-2018 Homolo Co., Ltd. All rights reserved.
 */
package com.tongdao.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tongdao.entity.ConcatUs;
import com.tongdao.entity.PageInfo;
import com.tongdao.service.ConcatUsService;

/**
 * @author homolo-89
 * @date 2018年5月2日
 */
@Controller
@RequestMapping(value = "/news")
public class NewsController {
	
	@Autowired
	private ConcatUsService concatUsService;
	@Autowired
	
	//公司首页
	@RequestMapping(value = "/firstPackage.do")
	public ModelAndView firstPackage(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();
		view.setViewName("package/firstPackage");
		return view ;
	}
	
	//打开联系我们弹出页面
	@RequestMapping(value = "/connectionUs")
	public ModelAndView connectionUs(HttpServletRequest request,PageInfo pageInfo) {
		ModelAndView view =new ModelAndView();
		List<ConcatUs> concatUsList = concatUsService.findAll();
		view.addObject("concatUsList",concatUsList);
		view.setViewName("/package/concatUsForm");
		return view;
	}
	
	//打开团队介绍弹出页面
	@RequestMapping(value = "/teamProduce")
	public ModelAndView TeamProduce() {
		ModelAndView view = new ModelAndView();
		view.setViewName("package/teamProducePackage");
		return view;
	}
}
