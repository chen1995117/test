package com.tongdao.service;

import java.util.List;

import com.tongdao.entity.PageInfo;
import com.tongdao.entity.PictureInformation;

public interface PictureInformationService {
	
	void addPictureInformation(PictureInformation pictureInformation);
	void updatePictureInformation(PictureInformation pictureInformation);
	void deleteOne(int id);
	void findDataGrid(PageInfo pageInfo);
	List<PictureInformation>findPageCondition(PageInfo pageInfo);
	PictureInformation findOneById(Integer id);
}
