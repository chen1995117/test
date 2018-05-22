package com.tongdao.entity;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtil {
	private final String toolequipPath="photos/equip"; //带电工器具目录    
	private final String vehiclePath="photos/vehicle";//车辆目录    
	private final String userPath="photos/user";//用户目录   
	private final String sitePath="photos/site";//站点目录   
	/***  
     * 保存文件  
     *  
     * @param file  
     * @return  
     */  
    private String saveFile(HttpServletRequest request, MultipartFile file,String uploadPath) {  
    	String filePaths="";
        // 判断文件是否为空  
        if (!file.isEmpty()) {  
            try {  
            	long times=System.currentTimeMillis();//时间戳
                // 保存的文件路径(如果用的是Tomcat服务器，文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\upload\\文件夹中  )  
                String programPath=request.getSession().getServletContext()  
                        .getRealPath("/");
                if(!programPath.endsWith("\\")){
                	programPath+="\\";
                }
                String fileName=file.getOriginalFilename();
                String lastName=fileName.substring(fileName.lastIndexOf("."));
            	String filePath = programPath + uploadPath+"/" +times+ lastName;
                String returnFilePath="/"+uploadPath+"/" +times+ lastName;
                File saveDir = new File(filePath);  
                if (!saveDir.getParentFile().exists())  
                    saveDir.getParentFile().mkdirs();  
                 System.err.println(filePath);  
                // 转存文件  
                file.transferTo(saveDir);
                filePaths+=returnFilePath+";";
            } catch (Exception e) {  
                e.printStackTrace();  
            }  
        }  
        
        
        return filePaths;  
    }  
   
    /**  
     * 上传图片  
     * @param type;1 带电工具 2 车辆 3用户 4站点
     * @param files  
     * @param request  
     * @return  
     */  
    public String filesUpload(int type,MultipartFile[] files, HttpServletRequest request) {  
    	String filePaths=null;	
        if (files != null && files.length > 0) {  
            for (int i = 0; i < files.length; i++) {  
                MultipartFile file = files[i];
                // 保存文件  
                switch (type) {
				case 1:
					filePaths = saveFile(request, file,toolequipPath);  
					break;
				case 2:
					filePaths = saveFile(request, file,vehiclePath);  
					break;
				case 3:
					filePaths = saveFile(request, file,userPath);  
					break;
				case 4:
					filePaths = saveFile(request, file,sitePath);  
					break;
				}
                
                
            }  
        }  
        try {
        	if(filePaths.length() > 0){
        		filePaths = filePaths.substring(0,filePaths.length() - 1);
        	}        	
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        // 重定向  
        return filePaths;  
    }
}
