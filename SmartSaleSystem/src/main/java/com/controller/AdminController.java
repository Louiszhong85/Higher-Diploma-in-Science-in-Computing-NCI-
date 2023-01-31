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
import com.service.AdminService;
 
import com.service.StaffService;
import com.util.PageUtil;
import com.util.UploadUtil;
@Controller
@RequestMapping("")
public class   AdminController {
	private static final int rows = 10;
	@Autowired
	private AdminService adminService;
	@Autowired
 
	private StaffService staffService;
/*
 * Search by condition
 * @param request
 * @return
 */
	@RequestMapping("/adminsearlist")
	public String adminsearlist(HttpServletRequest request) {
     String urlString = "";
     String ty = "";
    String Where = "";
//Operation of the query section

if (request.getParameter("username") == null || request.getParameter("username").equals("")) { }
  else {
	  String username = request.getParameter("username").toString();
	  Where = " and username like'%" + username + "%'"; 
	  }

 
//Operation of the query section


	 if (request.getParameter("ty") == null||request.getParameter("ty").equals(""))
	{	return "/admin/admin_list";}
	 
	 
		request.setAttribute("adminList", adminService.searlist(Where));
    urlString = "/admin/admin_list";
return urlString;

 	}
	
	@RequestMapping("/adminlogin")
	public String adminlogin(Admin admin, HttpServletRequest request, HttpSession session) {	 
		String username =request.getParameter("username");
		 String pwd =request.getParameter("pwd");		 
		 String role =request.getParameter("role");
			String urlString=""; 		
//		1 for admin user，2 employee
		 if(role.equals("1"))
		{	 
			 Admin admin2=adminService.userlogin(username, pwd);
			 if (admin2!=null) 
			 {
				request.setAttribute("msg", "Login succeed!");	
				session.setAttribute("username", username);
				session.setAttribute("pwd", pwd);
				session.setAttribute("role", "Admin");
				return "admin/main";
			}
			 request.setAttribute("isFlag", "1");
			 request.setAttribute("msg", "The Username or Password incorrect!");				 
		 }
		 if(role.equals("2"))
			 {	
			 Staff yg=staffService.userlogin(username, pwd);
			 System.out.print(username);
			 System.out.print(pwd);
			 if (yg!=null) {
				 request.setAttribute("msg", "Suceed!"); 				 
					session.setAttribute("username", username);
					session.setAttribute("pwd", pwd);
					session.setAttribute("xm", yg.getStaffName());
					session.setAttribute("UID", yg.getId());
					session.setAttribute("role", "Employee");
					return "admin/main2";
			}			 
			 request.setAttribute("isFlag", "1");
			 request.setAttribute("msg", "Incorrect Username or Passwrod!");
		}
			 	return "admin/Login";
	}
	/**
	 * Exit
	 * @return
	 */ 
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("username");
		return "admin/Login";
		 
	}
	/**
 * Get list information
 * @param request
 * @return
 */
	@RequestMapping("/adminList")
	public String adminList(HttpServletRequest request) {
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
		request.setAttribute("adminList", adminService.getList(page, rows));
		request.setAttribute("pageHtml", PageUtil.getPageHtml(request,adminService.getTotal(), page, rows)); 

		return "/admin/admin_list";
 	}
	/**
 * Add Information
 * @param request
 * @return
 */
	@RequestMapping("/adminAdd")
	public String adminAdd(Admin admin, HttpServletRequest request) {
			adminService.add(admin);
			return "redirect:adminList";
 	}
	/**
 * Update Information
 * @param request
 * @return
 */
	@RequestMapping("/adminEdit")
	public String adminEdit(int id,  HttpServletRequest request) {
			request.setAttribute("flag", 2);
			request.setAttribute("admin", adminService.get(id));
		return "/admin/adminEdit";
 	}
	/**
 * Update Information
 * @param request
 * @return
 */
	@RequestMapping("/adminUpdate")
	public String adminUpdate(Admin admin, HttpServletRequest request) {
			adminService.update(admin);
			return "redirect:adminList";
 	}
	/**
 * Delete Information
 * @param request
 * @return
 */
	@RequestMapping("/adminDelete")
	public String adminDelete(int id, HttpServletRequest request) {
			adminService.delete(id);
			return "redirect:adminList";
 	}
	/**
	 * Edit Password
	 * @param request
	 * @return
	 */
		@RequestMapping("/adminpwd")
		public String adminpwd(Admin admin, HttpServletRequest request, HttpSession session) {
			String pwd1=request.getParameter("pwd1").toString();
			String pwd2=request.getParameter("pwd2").toString();
			String pwd3=request.getParameter("pwd3").toString();
			String username= session.getAttribute("username").toString();
			String spwd= session.getAttribute("pwd").toString();
			
			if (pwd1.equals(spwd)) 
			{
					if (!pwd2.equals(pwd3)) 
				{
					request.setAttribute("msg", "The password Inconsistent");
				}
				else
				{
					admin.setUsername(username);
					admin.setPwd(pwd3);
					adminService.pwd(username, pwd3);
					request.setAttribute("msg", "Suceed!");
					return "/admin/adminpwd";
				} 
			} 
			else
			{
				request.setAttribute("msg", "Incorrect Old Password!");
		    	return "/admin/adminpwd";
				
			} 
		
			return "/admin/adminpwd";
		}
}
