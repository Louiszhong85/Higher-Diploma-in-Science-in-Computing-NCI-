package com.controller;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.entity.Admin;
import com.entity.Staff;
import com.service.StaffService;
import com.util.PageUtil;
import com.util.UploadUtil;
@Controller
@RequestMapping("")
public class   StaffController {
	private static final int rows = 10;
	@Autowired
	private StaffService staffService;
	/**
 * Search by condition
 * @param request
 * @return
 */
	@RequestMapping("/staffsearlist")
	public String staffsearlist(HttpServletRequest request) {
     String urlString = "";
     String ty = "";
    String Where = "";
String uname= request.getSession().getAttribute("username").toString();
//Operation of the query section

if (request.getParameter("username") == null || request.getParameter("username").equals("")) { }
  else { String username = request.getParameter("username").toString(); Where = Where+" and username like'%" + username + "%'"; }

if (request.getParameter("staffName") == null || request.getParameter("staffName").equals("")) { }
  else { String staffName = request.getParameter("staffName").toString(); Where = Where+" and staffName like'%" + staffName + "%'"; }
//Operation of the query section
		request.setAttribute("staffList", staffService.searlist(Where));
    urlString = "/admin/staff_list";
	 if (request.getParameter("ty") == null||request.getParameter("ty").equals(""))
	{	return "/admin/staff_list";}
else{
      ty = request.getParameter("ty").toString();
      if(ty.equals("1")){
		return "/admin/staff_list";
         }
  
   }
return urlString;

 	}
	/**
 * Get list information
 * @param request
 * @return
 */
	@RequestMapping("/staffList")
	public String staffList(HttpServletRequest request) {
		request.setAttribute("flag", 2);
		int page=1;
		if(request.getParameter("page")==null)
		{
			page=1;
		}
		else
		{
		page=Integer.parseInt(request.getParameter("page"));
		}
		request.setAttribute("page", page);
		request.setAttribute("staffList", staffService.getList(page, rows));
		request.setAttribute("pageHtml", PageUtil.getPageHtml(request,staffService.getTotal(), page, rows)); 

		return "/admin/staff_list";
 	}
	/**
 * Add Information
 * @param request
 * @return
 */
	@RequestMapping("/staffAdd")
	public String staffAdd(Staff staff, HttpServletRequest request) {
			staffService.add(staff);
			return "redirect:staffList";
 	}
	/**
 * Update Information
 * @param request
 * @return
 */
	@RequestMapping("/staffEdit")
	public String staffEdit(int id,  HttpServletRequest request) {
			request.setAttribute("flag", 2);
			request.setAttribute("staff", staffService.get(id));
		return "/admin/staffEdit";
 	}
	
	/**
 *personal information
 * @param request
 * @return
 */
	@RequestMapping("/staffinfo")
	public String staffinfo(HttpServletRequest request) {
			request.setAttribute("flag", 2);
			  String UID = request.getSession().getAttribute("UID").toString();
			  int iuid=Integer.valueOf(UID);
			  System.out.print(iuid);
	 request.setAttribute("staff",staffService.get(iuid));
		return "/admin/staffinfo";
 	}
	
	/**
 * Update personal information
 * @param request
 * @return
 */
	@RequestMapping("/updateinfo")
	public String updateinfo(Staff staff, HttpServletRequest request) {
			staffService.update(staff);
			return "redirect:staffinfo";
 	}
	/**
 * Update Information
 * @param request
 * @return
 */
	@RequestMapping("/staffUpdate")
	public String staffUpdate(Staff staff, HttpServletRequest request) {
			staffService.update(staff);
			return "redirect:staffList";
 	}
	/**
 * Delete Information
 * @param request
 * @return
 */
	@RequestMapping("/staffDelete")
	public String staffDelete(int id, HttpServletRequest request) {
			staffService.delete(id);
			return "redirect:staffList";
 	}
	/**
	 * Edit Password
	 * @param request
	 * @return
	 */
		@RequestMapping("/ygpwd")
		public String ygpwd( HttpServletRequest request, HttpSession session) {
			String pwd1=request.getParameter("pwd1").toString();
			String pwd2=request.getParameter("pwd2").toString();
			String pwd3=request.getParameter("pwd3").toString();
			String username= session.getAttribute("username").toString();
			String spwd= session.getAttribute("pwd").toString();
			
			if (pwd1.equals(spwd)) 
			{
					if (!pwd2.equals(pwd3)) 
				{
					request.setAttribute("msg", "Inconsistent password!");
				}
				else
				{
					 
					staffService.pwd(username,pwd3);
					request.setAttribute("msg", "Succeed!");
					return "/admin/xpwd";
				} 
			} 
			else
			{
				request.setAttribute("msg", "Incorrect Old Password!");
		    	return "/admin/xpwd";
				
			} 
		
			return "/admin/xpwd";
		}
}

