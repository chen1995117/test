package com.tongdao.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.tongdao.entity.Resource;
@Repository("resourceDao") 
public interface ResourceDao {
	
	List<Resource> findResourceAll();
	void deleteResourceById(Long id);
	Resource findResourceById(Long id);
	List<Resource> findResourceAllByTypeAndPidNull(Integer resourceMenu);
	void insert(Resource resource);
	void updateResource(Resource resource);
	List<Resource> findResourceAllByTypeAndPid(@Param("resourceType") Integer resourceType, @Param("pid") Long pid);
}
