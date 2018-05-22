/**
 * Project:cxh_first_practice
 * File:MenuController.java
 * Copyright 2004-2018 Homolo Co., Ltd. All rights reserved.
 */
package com.tongdao.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tongdao.entity.Tree;
import com.tongdao.service.ResourceService;

/**
 * @author homolo-89
 * @date 2018年5月9日
 */
@Controller
@RequestMapping("/menu")
public class MenuController {
	@Autowired
	private ResourceService resourceService;
	
	 //首页
    @RequestMapping(value = "/manager", method = RequestMethod.GET)
    public ModelAndView manager(HttpServletRequest req, HttpServletResponse resp) {
    	ModelAndView view = new ModelAndView("/package/menu");
        return view;
    }
    
	@RequestMapping(value = "/treeGrid", method = RequestMethod.POST)
    @ResponseBody
    public List<Tree> tree() {
        List<Tree> tree = resourceService.findTree();
        return tree;
    }
}
