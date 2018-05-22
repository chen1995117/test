package com.tongdao.dao;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.tongdao.entity.ConcatUs;
import com.tongdao.entity.PageInfo;

@Repository("motherCompannyDao") 
public interface ConcatUsDao {
	void insert(ConcatUs concatUs);
	void update(ConcatUs concatUs);
	void delete(Long id);
	List<ConcatUs>findPageCondition(PageInfo pageInfo);
    int findPageCount(PageInfo pageInfo);
	List<ConcatUs>  findById(Long id);
	List<ConcatUs> findAll();
	List<ConcatUs> findByPid(String pid);
	ConcatUs findOneById(Long id);
}
