package com.util;

import java.io.File;
import java.io.IOException;
import java.util.Date;


import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;



public class UploadUtil {
	// @RequestMapping("upload")
	 public static String upload (MultipartFile file, HttpServletRequest request) {

	        	//Check doc it is empty  
	            // get original name
	            String fileName = file.getOriginalFilename();
	            System.out.println("filename:"+fileName);
	            //get name suffix
	   		 String prefix=fileName.substring(fileName.lastIndexOf(".")+1);

	            // re-name doc
	            String newfileName = new Date().getTime() + "." + prefix;
	            //get webapp path   获得物理路径webapp所在路径
	         
	            String pathRoot = request.getSession().getServletContext().getRealPath("/")+"upload/";
	            // project path项目下相对路径
	            String path = pathRoot + newfileName;
	            System.out.println(path);
	            // cretae doc
	            File tempFile = new File(pathRoot, newfileName);
	            // 判断父级目录是否存在，不存在则创建
	            if (!tempFile.getParentFile().exists()) {
	                tempFile.getParentFile().mkdir();
	            }
	            // 判断文件是否存在，否则创建文件（夹）
	            if (!tempFile.exists()) {
	                tempFile.mkdir();
	            }

	            try {
	                // 将接收的文件保存到指定文件中
	                file.transferTo(tempFile);
	            } catch (IllegalStateException e) {
	                e.printStackTrace();
	            } catch (IOException e) {
	                e.printStackTrace();
	            }

	            // 方法一：model属性也行
	          //  model.addAttribute("fileUrl", path); //保存路径，用于jsp页面回显
	            // 方法二：Request域属性也行，两个二选一即可。
	            // request.setAttribute("fileUrl", path);
		        return newfileName; // 转发到upload.jsp页面

	   

	        // getWiewPath方法里就处理了一些路径，相当于转发forward，返回 return "cms/notices/upload";
	    }

	
	
}