package com.tongdao.service.impl;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tongdao.dao.ConcatUsDao;
import com.tongdao.entity.ConcatUs;
import com.tongdao.entity.PageInfo;
import com.tongdao.entity.Tree;
import com.tongdao.service.ConcatUsService;

@Service("concatUsService")
public class ConcatUsServiceImpl implements ConcatUsService{
	
	@Autowired
	private ConcatUsDao concatUsDao;
	
	public void insert(ConcatUs concatUs) {
		concatUsDao.insert(concatUs);		
	}

	public void update(ConcatUs concatUs) {
		concatUsDao.update(concatUs);		
	}

	public void delete(Long id) {
		concatUsDao.delete(id);		
	}

	public void findDataGrid(PageInfo pageInfo) {
		pageInfo.setTotal(concatUsDao.findPageCount(pageInfo));	
		pageInfo.setRows(concatUsDao.findPageCondition(pageInfo));
	}

	public List<ConcatUs> findPageCondition(PageInfo pageInfo) {
		return concatUsDao.findPageCondition(pageInfo);
	}

	public List<ConcatUs> findById(Long id) {
		return concatUsDao.findById(id);
	}

	public List<ConcatUs> findAll() {
		return concatUsDao.findAll();
	}

	public List findAllTrees() {
		List<Tree> treeOneList = new ArrayList<Tree>();
		List<ConcatUs> concatUss = concatUsDao.findAll();
		if(concatUss == null) {
			return null;
		}
		for(ConcatUs concatUs:concatUss) {
			Tree treeOne = new Tree();
			treeOne.setId(concatUs.getId());
			treeOne.setText(concatUs.getCompanyName());
			List<ConcatUs> sonConcatUss = concatUsDao.findByPid(concatUs.getPid());
			if(sonConcatUss == null) {
				return null ;
			}else {
				List<Tree> treeTwoList = new ArrayList<Tree>();
				for(ConcatUs sonConcatUs:sonConcatUss) {
					Tree treeTwo = new Tree();
					treeTwo.setId(sonConcatUs.getId());
					treeTwo.setText(sonConcatUs.getCompanyName());
					treeTwo.setPid(sonConcatUs.getPid());
					treeTwoList.add(treeTwo);
				}
				treeOne.setChildren(treeTwoList);
			}
			treeOneList.add(treeOne);
		}
		return treeOneList;
	}

	public List<ConcatUs> findByPid(String pid) {
		return concatUsDao.findByPid(pid);
	}

	public ConcatUs findOneById(Long id) {
		return concatUsDao.findOneById(id);
	}
}
