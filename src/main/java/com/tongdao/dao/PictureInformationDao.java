package com.tongdao.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tongdao.entity.PageInfo;
import com.tongdao.entity.PictureInformation;
@Repository("pictureInformationDao") 
public interface PictureInformationDao {
	
	void insert(PictureInformation pictureInformation);
	void updatePictureInformation(PictureInformation pictureInformation);
	void deleteOne(int id);
	List<PictureInformation>findPageCondition(PageInfo pageInfo);
    int findPageCount(PageInfo pageInfo);
    PictureInformation findOneById(Integer id);
}
