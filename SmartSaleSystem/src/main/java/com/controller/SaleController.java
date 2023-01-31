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

import com.entity.Sale;
import com.service.SaleService;
import com.service.ProductService;
import com.util.PageUtil;
import com.util.UploadUtil;
@Controller
@RequestMapping("")
public class   SaleController {
	private static final int rows = 10;
	@Autowired
	private SaleService saleService;
	@Autowired
	private ProductService productService;
	/**
 * Search by condition
 * @param request
 * @return
 */
	@RequestMapping("/salesearlist")
	public String salesearlist(HttpServletRequest request) {
     String urlString = "";
     String ty = "";
    String Where = "";
String uname= request.getSession().getAttribute("username").toString();
//Operation of the query section

if (request.getParameter("itemID") == null || request.getParameter("itemID").equals("")) { }
  else { String itemID = request.getParameter("itemID").toString(); Where = Where+" and itemID like'%" + itemID + "%'"; }

if (request.getParameter("itemName") == null || request.getParameter("itemName").equals("")) { }
  else { String itemName = request.getParameter("itemName").toString(); Where = Where+" and itemName like'%" + itemName + "%'"; }
if (request.getParameter("saleDate") == null || request.getParameter("saleDate").equals("")) { }
else { String saleDate = request.getParameter("saleDate").toString(); Where = Where+" and saleDate like'%" + saleDate + "%'"; }



//Operation of the query section
		request.setAttribute("saleList", saleService.searlist(Where));
    urlString = "/admin/sale_list";
	 if (request.getParameter("ty") == null||request.getParameter("ty").equals(""))
	{	return "/admin/sale_list";}
else{
      ty = request.getParameter("ty").toString();
  
      
      if(ty.equals("1")){
		return "/admin/sale_list";
         }
      
      if(ty.equals("t")){
		return "/admin/sale_list_t";
         }
      
      
      
      //员工查看自己的销售情况
      if(ty.equals("y")){
    	  String username= request.getSession().getAttribute("username").toString();
			 Where="and operator='"+username+"'";
			 request.setAttribute("saleList", saleService.searlist(Where));
  		return "/admin/sale_list";
           }
        
      
      
   }
return urlString;

 	}
	/**
 * Get list information
 * @param request
 * @return
 */
	@RequestMapping("/saleList")
	public String saleList(HttpServletRequest request) {
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
		request.setAttribute("saleList", saleService.getList(page, rows));
		request.setAttribute("pageHtml", PageUtil.getPageHtml(request,saleService.getTotal(), page, rows)); 

		return "/admin/sale_list";
 	}
	/**
 * Add Information
 * @param request
 * @return
 */
	@RequestMapping("/saleAdd")
	public String saleAdd(Sale sale, HttpServletRequest request) {
			saleService.add(sale);
			int shuliang=Integer.valueOf( sale.getQuantity());
			
			productService.addkucun(sale.getItemID(), -shuliang);
			
			 String urlString = "redirect:saleList";
			 String role= request.getSession().getAttribute("role").toString();
			 if(role.equals("员工")){
				 urlString = "redirect:salesearlist?ty=y";
			 }
			return urlString;
 	}
	/**
 * Update Information
 * @param request
 * @return
 */
	@RequestMapping("/saleEdit")
	public String saleEdit(int id,  HttpServletRequest request) {
			request.setAttribute("flag", 2);
			request.setAttribute("sale", saleService.get(id));
		return "/admin/saleEdit";
 	}
	/**
 * Update Information
 * @param request
 * @return
 */
	@RequestMapping("/saleUpdate")
	public String saleUpdate(Sale sale, HttpServletRequest request) {
			saleService.update(sale);
			return "redirect:saleList";
 	}
	/**
 * Delete Information
 * @param request
 * @return
 */
	@RequestMapping("/saleDelete")
	public String saleDelete(int id, HttpServletRequest request) {
			saleService.delete(id);
			return "redirect:saleList";
 	}
}
