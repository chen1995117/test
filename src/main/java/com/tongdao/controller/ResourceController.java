package com.tongdao.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tongdao.entity.Resource;
import com.tongdao.entity.Result;
import com.tongdao.entity.Tree;
import com.tongdao.entity.User;
import com.tongdao.service.ResourceService;


@Controller
@RequestMapping("/resource")
public class ResourceController {
	@Autowired 
	private ResourceService resourceService;
	 
	
	@RequestMapping(value = "/manager", method = RequestMethod.GET)
    public String manager() {
        return "package/resource";
    }
	
	@RequestMapping("/delete")
	public Result delete(Long id) {
        Result result = new Result();
        try {
            resourceService.deleteResourceById(id);
            result.setMsg("删除成功！");
            result.setSuccess(true);
            return result;
        } catch (RuntimeException e) {
            result.setMsg(e.getMessage());
            return result;
        }
    }
	
   
   /* @RequestMapping("/add")
    @ResponseBody
    public Result add(Resource resource) {
        Result result = new Result();
        try {
            resourceService.addResource(resource);
            result.setSuccess(true);
            result.setMsg("添加成功！");
            return result;
        } catch (RuntimeException e) {
            result.setMsg(e.getMessage());
            return result;
        }
    }*/
	
	@RequestMapping("/addPage")
    public String addPage() {
        return "/package/resourceAdd";
    }
	
	@RequestMapping("/loadResource")
    public String editPage(HttpServletRequest request, Long id) {
        Resource resource = resourceService.findResourceById(id);
        request.setAttribute("resource", resource);
        return "/package/resourceEdit";
    }
	
	 @RequestMapping("/addOrUpdateResource")
	    @ResponseBody
	    public Result edit(Resource resource,HttpServletRequest req) {
		 	String id = req.getParameter("id");
	        Result result = new Result();
	        try {
	        	if(id!=null && id!="") {
	        		 resourceService.updateResource(resource);
	        	}else {
	        		resourceService.addResource(resource);
	        	}
	        	 result.setSuccess(true);
	        	 result.setMsg("编辑成功！");
	 	         return result;
	        } catch (RuntimeException e) {
	            result.setMsg(e.getMessage());
	            return result;
	        }
	    }
	
    @RequestMapping(value = "/resourceAllTrees", method = RequestMethod.POST)
    @ResponseBody
    public List<Tree> resourceAllTrees() {
        return resourceService.resourceAllTrees();
    }
    
    @RequestMapping(value = "/treeGrid", method = RequestMethod.POST)
    @ResponseBody
    public List<Tree> tree() {
        List<Tree> tree = resourceService.findTree();
        return tree;
    }

}
