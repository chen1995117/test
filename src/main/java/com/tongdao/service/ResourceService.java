package com.tongdao.service;



import java.util.List;

import com.tongdao.entity.Resource;
import com.tongdao.entity.Tree;
public interface ResourceService {
	List<Resource> findResourceAll();
	void deleteResourceById(Long id);
	Resource findResourceById(Long id);
	List<Tree> resourceAllTrees();
	void addResource(Resource resource);
	void updateResource(Resource resource);
	List<Tree> findTree();
}
