package com.tongdao.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.tongdao.entity.FileUploadUtil;
import com.tongdao.entity.PageInfo;
import com.tongdao.entity.PictureInformation;
import com.tongdao.entity.Result;
import com.tongdao.service.PictureInformationService;

@Controller
@RequestMapping("/pictureInformation")
public class PictureInformationController {
	@Autowired
	private PictureInformationService pictureInformationService;
    
    //首页
    @RequestMapping(value = "/manager", method = RequestMethod.GET)
    public ModelAndView manager(HttpServletRequest req, HttpServletResponse resp) {
    	ModelAndView view = new ModelAndView("/package/pictureInformation");
        return view;
    }
    
    //资源列表
    @RequestMapping("/dataGrid")
	@ResponseBody
	public PageInfo findDataGrid(Integer page,Integer rows,HttpServletRequest req){
		PageInfo pageInfo=new PageInfo(page,rows);
		pictureInformationService.findDataGrid(pageInfo);
		return pageInfo;
	}
    
    //面板信息
    @RequestMapping(value = "/loadPictureInformation")
    public ModelAndView loadMotherComPanny(HttpServletRequest req, HttpServletResponse resp) {
    	ModelAndView view = new ModelAndView("/package/pictureInformationEdit");
    	String id=req.getParameter("id");
    	PictureInformation pictureInformation = new PictureInformation();
    	if(id!=null && id !="") {
    		pictureInformation =pictureInformationService.findOneById(Integer.valueOf(id));
    	}
    	view.addObject("pictureInformation", pictureInformation);
        return view;
    }
    
    //修改或者增加
	@RequestMapping("/saveOrUpdatePictureInformation")
	@ResponseBody
	public Result edit(PictureInformation pictureInformation,@RequestParam("myfiles") MultipartFile[] files,HttpServletRequest request) {
		Result result = new Result();
		String filepaths="";
		if (files != null && files.length > 0) {
			FileUploadUtil fileUploadUtils=new FileUploadUtil();
			filepaths=fileUploadUtils.filesUpload(4, files, request);
			if(filepaths.length() > 0){
				pictureInformation.setPicture(filepaths);
			}
		}
		if (pictureInformation.getId()!= null) {
			pictureInformationService.updatePictureInformation(pictureInformation);
		} else {
			pictureInformationService.addPictureInformation(pictureInformation);
		}
		result.setSuccess(true);
		result.setMsg("编辑成功！");
		return result;

	}
	
	//删除
    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(Integer id) {
        Result result = new Result();
        try {
        	pictureInformationService.deleteOne(id);
            result.setMsg("删除成功！");
            result.setSuccess(true);
            return result;
        } catch (RuntimeException e) {
            result.setMsg(e.getMessage());
            return result;
        }
    }
}
