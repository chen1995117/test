package com.tongdao.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.tongdao.entity.ConcatUs;
import com.tongdao.entity.PageInfo;
import com.tongdao.entity.Result;
import com.tongdao.entity.Tree;
import com.tongdao.service.ConcatUsService;

@Controller
@RequestMapping("/concatUs")
public class MotherCompannyController {
	
	@Autowired
	private ConcatUsService concatUsService;
    
    //首页
    @RequestMapping(value = "/manager", method = RequestMethod.GET)
    public ModelAndView manager(HttpServletRequest req, HttpServletResponse resp) {
    	ModelAndView view = new ModelAndView("/package/concatUs");
        return view;
    }
    
    //资源列表
    @RequestMapping("/dataGrid")
	@ResponseBody
	public PageInfo findDataGrid(Integer page,Integer rows,HttpServletRequest req){
    	String establishedTime = req.getParameter("establishedTime1");
    	String establishedTime2 = req.getParameter("establishedTime2"); 
    	Map<String,Object>condition = new HashMap<String,Object>();
    	if(establishedTime!=null &&establishedTime != "") {
    		condition.put("establishedTime", establishedTime);
    	}
    	if(establishedTime!=null &&establishedTime != "") {
    		condition.put("establishedTime2", establishedTime2);
    	}
		PageInfo pageInfo=new PageInfo(page,rows);
		pageInfo.setCondition(condition);
		concatUsService.findDataGrid(pageInfo);
		return pageInfo;
	}
    
    //公司二级树
    @RequestMapping(value = "/tree", method = RequestMethod.POST)
    @ResponseBody
    public List<Tree> tree() {
        List<Tree> tree=concatUsService.findAllTrees();
        return tree;
    }
    
    //面板信息
    @RequestMapping(value = "/loadConcatUs")
    public ModelAndView loadMotherComPanny(HttpServletRequest req, HttpServletResponse resp) {
    	ModelAndView view =new ModelAndView();
    	String id=req.getParameter("id");
    	ConcatUs concatUs = new ConcatUs();
    	if(id!=null && id!="") {
    		concatUs =concatUsService.findOneById(Long.valueOf(id));
    	}
    	view.addObject("concatUs", concatUs);
    	view.setViewName("/package/concatUsEdit");
        return view;
    }
    
    //增加或者修改
	@RequestMapping("/saveOrUpdateConcatUs")
	@ResponseBody
	public Result edit(ConcatUs concatUs,HttpServletRequest req) {
		Result result = new Result();
		String establishedTimeStr =req.getParameter("establishedTime");
		concatUs.setEstablishedTime(establishedTimeStr);
		if (concatUs.getId() != null) {
			concatUsService.update(concatUs);
		} else {
			concatUsService.insert(concatUs);
		}
		result.setSuccess(true);
		result.setMsg("编辑成功！");
		return result;

	}
	
	//删除
    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(Long id) {
        Result result = new Result();
        try {
        	concatUsService.delete(id);
            result.setMsg("删除成功！");
            result.setSuccess(true);
            return result;
        } catch (RuntimeException e) {
            result.setMsg(e.getMessage());
            return result;
        }
    }
}
