package com.tongdao.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tongdao.dao.PictureInformationDao;
import com.tongdao.entity.PageInfo;
import com.tongdao.entity.PictureInformation;
import com.tongdao.service.PictureInformationService;
@Service("pictureInformationService")
public class PictureInformationServiceImpl implements PictureInformationService{
	
	@Autowired
	private PictureInformationDao pictureInformationDao;
	
	public void addPictureInformation(PictureInformation pictureInformation) {
		pictureInformationDao.insert(pictureInformation);
	}

	public void updatePictureInformation(PictureInformation pictureInformation) {
		pictureInformationDao.updatePictureInformation(pictureInformation);
	}

	public void deleteOne(int id) {
		pictureInformationDao.deleteOne(id);
	}

	public void findDataGrid(PageInfo pageInfo) {
		pageInfo.setTotal(pictureInformationDao.findPageCount(pageInfo));
		pageInfo.setRows(pictureInformationDao.findPageCondition(pageInfo));
	}

	public List<PictureInformation> findPageCondition(PageInfo pageInfo) {
		return pictureInformationDao.findPageCondition(pageInfo);
	}

	public PictureInformation findOneById(Integer id) {
		return pictureInformationDao.findOneById(id);
	}
}
