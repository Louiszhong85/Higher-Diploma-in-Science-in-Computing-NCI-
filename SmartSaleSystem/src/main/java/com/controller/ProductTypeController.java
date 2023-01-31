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

import com.entity.ProductType;
import com.service.ProductTypeService;
import com.util.PageUtil;
import com.util.UploadUtil;
@Controller
@RequestMapping("")
public class ProductTypeController {
	private static final int rows = 10;
	@Autowired
	private ProductTypeService productTypeService;
	/**
 * Search by condition
 * @param request
 * @return
 */
	@RequestMapping("/productTypesearlist")
	public String productTypesearlist(HttpServletRequest request) {
     String urlString = "";
     String ty = "";
    String Where = "";
String uname= request.getSession().getAttribute("username").toString();
//Operation of the query section

if (request.getParameter("typeName") == null || request.getParameter("typeName").equals("")) { }
  else { String typeName = request.getParameter("typeName").toString(); Where = Where+" and typeName like'%" + typeName + "%'"; }
//Operation of the query section
		request.setAttribute("productTypeList", productTypeService.searlist(Where));
    urlString = "/admin/productType_list";
	 if (request.getParameter("ty") == null||request.getParameter("ty").equals(""))
	{	return "/admin/productType_list";}
else{
      ty = request.getParameter("ty").toString();
      if(ty.equals("1")){
		return "/admin/productType_list";
         }
      
      if(ty.equals("yp")){
    	  
  		return "/admin/productAdd";
           }
   }
return urlString;

 	}
	
	
 
	/**
 * Get list information
 * @param request
 * @return
 */
	@RequestMapping("/productTypeList")
	public String productTypeList(HttpServletRequest request) {
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
		request.setAttribute("productTypeList", productTypeService.getList(page, rows));
		request.setAttribute("pageHtml", PageUtil.getPageHtml(request,productTypeService.getTotal(), page, rows)); 

		return "/admin/productType_list";
 	}
	/**
 * Add Information
 * @param request
 * @return
 */
	@RequestMapping("/productTypeAdd")
	public String productTypeAdd(ProductType productType, HttpServletRequest request) {
			productTypeService.add(productType);
			return "redirect:productTypeList";
 	}
	/**
 * Update Information
 * @param request
 * @return
 */
	@RequestMapping("/productTypeEdit")
	public String productTypeEdit(int id,  HttpServletRequest request) {
			request.setAttribute("flag", 2);
			request.setAttribute("productType", productTypeService.get(id));
		return "/admin/productTypeEdit";
 	}
	/**
 * Update Information
 * @param request
 * @return
 */
	@RequestMapping("/productTypeUpdate")
	public String productTypeUpdate(ProductType productType, HttpServletRequest request) {
			productTypeService.update(productType);
			return "redirect:productTypeList";
 	}
	/**
 * Delete Information
 * @param request
 * @return
 */
	@RequestMapping("/productTypeDelete")
	public String productTypeDelete(int id, HttpServletRequest request) {
			productTypeService.delete(id);
			return "redirect:productTypeList";
 	}
}
