package com.tongdao.service;

import java.util.List;

import com.tongdao.entity.ConcatUs;
import com.tongdao.entity.PageInfo;

public interface ConcatUsService {
	void insert(ConcatUs concatUs);
	void update(ConcatUs concatUs);
	void delete(Long id);
	void findDataGrid(PageInfo pageInfo);
	List<ConcatUs>findPageCondition(PageInfo pageInfo);
	List<ConcatUs>  findById(Long id);
	List<ConcatUs> findAll();
	List findAllTrees();
	List<ConcatUs> findByPid(String pid);
	ConcatUs findOneById(Long id);

}
