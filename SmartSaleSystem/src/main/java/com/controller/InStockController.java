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

import com.entity.InStock;
import com.service.InStockService;
import com.service.ProductService;
import com.util.PageUtil;
import com.util.UploadUtil;
@Controller
@RequestMapping("")
public class   InStockController {
	private static final int rows = 10;
	@Autowired
	private InStockService inStockService;
	@Autowired
	private ProductService productService;
	/**
 * Search by condition
 * @param request
 * @return
 */
	@RequestMapping("/inStocksearlist")
	public String inStocksearlist(HttpServletRequest request) {
     String urlString = "";
     String ty = "";
    String Where = "";
String uname= request.getSession().getAttribute("username").toString();
//Operation of the query section

if (request.getParameter("itemID") == null || request.getParameter("itemID").equals("")) { }
  else { String itemID = request.getParameter("itemID").toString(); Where = Where+" and itemID like'%" + itemID + "%'"; }

if (request.getParameter("itemName") == null || request.getParameter("itemName").equals("")) { }
  else { String itemName = request.getParameter("itemName").toString(); Where = Where+" and itemName like'%" + itemName + "%'"; }
//Operation of the query section
		request.setAttribute("inStockList", inStockService.searlist(Where));
    urlString = "/admin/inStock_list";
	 if (request.getParameter("ty") == null||request.getParameter("ty").equals(""))
	{	return "/admin/inStock_list";}
else{
      ty = request.getParameter("ty").toString();
      if(ty.equals("1")){
		return "/admin/inStock_list";
         }
      //Search anaysi
      if(ty.equals("t")){
  		return "/admin/inStock_list_t";
           }
   }
return urlString;

 	}
	/**
 * Get list information
 * @param request
 * @return
 */
	@RequestMapping("/inStockList")
	public String inStockList(HttpServletRequest request) {
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
		request.setAttribute("inStockList", inStockService.getList(page, rows));
		request.setAttribute("pageHtml", PageUtil.getPageHtml(request,inStockService.getTotal(), page, rows)); 

		return "/admin/inStock_list";
 	}
	/**
 * Add Information
 * @param request
 * @return
 */
	@RequestMapping("/inStockAdd")
	public String inStockAdd(InStock inStock, HttpServletRequest request) {
			inStockService.add(inStock);			
				int shuliang=Integer.valueOf( inStock.getQuantity());			
				productService.addkucun(inStock.getItemID(), shuliang);
			return "redirect:inStockList";
 	}
	/**
 * Update Information
 * @param request
 * @return
 */
	@RequestMapping("/inStockEdit")
	public String inStockEdit(int id,  HttpServletRequest request) {
			request.setAttribute("flag", 2);
			request.setAttribute("inStock", inStockService.get(id));
		return "/admin/inStockEdit";
 	}
	/**
 * Update Information
 * @param request
 * @return
 */
	@RequestMapping("/inStockUpdate")
	public String inStockUpdate(InStock inStock, HttpServletRequest request) {
			inStockService.update(inStock);
			return "redirect:inStockList";
 	}
	/**
 * Delete Information
 * @param request
 * @return
 */
	@RequestMapping("/inStockDelete")
	public String inStockDelete(int id, HttpServletRequest request) {
			inStockService.delete(id);
			return "redirect:inStockList";
 	}
}
