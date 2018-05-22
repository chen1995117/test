package com.tongdao.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.tongdao.dao.ResourceDao;
import com.tongdao.entity.Config;
import com.tongdao.entity.Resource;
import com.tongdao.entity.Tree;
import com.tongdao.entity.User;
import com.tongdao.service.ResourceService;
@Service("resourceService")
public class ResourceServiceImpl implements ResourceService{
	
	@Autowired
	private ResourceDao resourceDao;
	
	public List<Resource> findResourceAll() {
		return resourceDao.findResourceAll();
	}
	
	public void deleteResourceById(Long id) {
		resourceDao.deleteResourceById(id);
	}
	
	public Resource findResourceById(Long id) {
		return resourceDao.findResourceById(id);
	}
	
	public List<Tree> resourceAllTrees() {
		List<Tree> treeOneList = new ArrayList<Tree>();
	    List<Resource> resources = resourceDao.findResourceAll();
	    if (resources == null) {
	        return null;
	    }
	    for (Resource resource : resources) {
	        if(resource.getId()!=null){
	            Tree treeOne = new Tree();
	            treeOne.setId(resource.getId());
	            treeOne.setText(resource.getName());
	            treeOne.setIconCls(resource.getIcon());
	            treeOne.setAttributes(JSONObject.parse("{'type':'1'}"));
	            treeOne.setValue(resource.getUrl());
	            treeOneList.add(treeOne);
        	}
	    }
	    return treeOneList;
	}

	public void addResource(Resource resource) {
		resourceDao.insert(resource);
	}

	public void updateResource(Resource resource) {
		// TODO Auto-generated method stub
		
	}

	public List<Tree> findTree() {
		List<Tree> trees = new ArrayList<Tree>();
        // 超级管理
        
            List<Resource> resourceFather = resourceDao.findResourceAllByTypeAndPidNull(Config.RESOURCE_MENU);
            if (resourceFather == null) {
                return null;
            }

            for (Resource resourceOne : resourceFather) {
                Tree treeOne = new Tree();

                treeOne.setId(resourceOne.getId());
                treeOne.setText(resourceOne.getName());
                treeOne.setIconCls(resourceOne.getIcon());
                treeOne.setAttributes(resourceOne.getUrl());
                List<Resource> resourceSon = resourceDao.findResourceAllByTypeAndPid(Config.RESOURCE_MENU, resourceOne.getId());

                if (resourceSon != null) {
                    List<Tree> tree = new ArrayList<Tree>();
                    for (Resource resourceTwo : resourceSon) {
                        Tree treeTwo = new Tree();
                        treeTwo.setId(resourceTwo.getId());
                        treeTwo.setText(resourceTwo.getName());
                        treeTwo.setIconCls(resourceTwo.getIcon());
                        treeTwo.setAttributes(resourceTwo.getUrl());
                        tree.add(treeTwo);
                    }
                    treeOne.setChildren(tree);
                } else {
                    treeOne.setState("closed");
                }
                trees.add(treeOne);
            }
            return trees;
     }
}
