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
import com.entity.Sale_tmp;
import com.service.SaleService;
import com.service.Sale_tmpService;
import com.service.ProductService;
import com.util.PageUtil;
import com.util.UploadUtil;
@Controller
@RequestMapping("")
public class   Sale_tmpController {
	private static final int rows = 10;
	@Autowired
	private Sale_tmpService sale_tmpService;
	@Autowired
	private SaleService saleService;
	@Autowired
	private ProductService productService;
	/**
 * Search by condition
 * @param request
 * @return
 */
	@RequestMapping("/sale_tmpsearlist")
	public String sale_tmpsearlist(HttpServletRequest request) {
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
		request.setAttribute("sale_tmpList", sale_tmpService.searlist(Where));
    urlString = "/admin/sale_tmp_list";
	 if (request.getParameter("ty") == null||request.getParameter("ty").equals(""))
	{	return "/admin/sale_tmp_list";}
else{
      ty = request.getParameter("ty").toString();
      if(ty.equals("1")){
		return "/admin/saleAdd";
         }
      
      //Employees check their sales
      if(ty.equals("y")){
    	  String username= request.getSession().getAttribute("username").toString();
			 Where="and operator='"+username+"'";
			 request.setAttribute("saleList", sale_tmpService.searlist(Where));
  		return "/admin/saleAdd";
           }
   }
return urlString;

 	}
	/**
 * Get list information
 * @param request
 * @return
 */
	
	@RequestMapping("/jiesuan")
	public String jiesuan(HttpServletRequest request) {
		 
		List<Sale_tmp> sale_tmp= sale_tmpService.searlist("");
		for (int i = 0; i < sale_tmp.size(); i++) {
			
			Sale		sale=new Sale();
			
			
			sale.setItemID(sale_tmp.get(i).getItemID());
			sale.setItemName(sale_tmp.get(i).getItemName());
			
			sale.setOperator (sale_tmp.get(i).getOperator());
			sale.setSaleDate(sale_tmp.get(i).getSaleDate());
			sale.setQuantity(sale_tmp.get(i).getQuantity());
			sale.setPrice(sale_tmp.get(i).getPrice());
			
		 
			
			saleService.add(sale);
			int quantity1=Integer.valueOf( sale.getQuantity());
			
			productService.addkucun(sale.getItemID(), -quantity1);
			System.out.print(sale_tmp.get(i).getId());		
			//empty list
			sale_tmpService.delete(sale_tmp.get(i).getId());
		}
		return "redirect:sale_tmpList";
 	}
	@RequestMapping("/sale_tmpList")
	public String sale_tmpList(HttpServletRequest request) {
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
		request.setAttribute("sale_tmpList", sale_tmpService.getList(page, rows));
		request.setAttribute("pageHtml", PageUtil.getPageHtml(request,sale_tmpService.getTotal(), page, rows)); 

		return "/admin/saleAdd";
 	}
	/**
 * Add Information
 * @param request
 * @return
 */
	@RequestMapping("/sale_tmpAdd")
	public String sale_tmpAdd(Sale_tmp sale_tmp, HttpServletRequest request) {
			sale_tmpService.add(sale_tmp);
			return "redirect:sale_tmpList";
 	}
	/**
 * Update Information
 * @param request
 * @return
 */
	@RequestMapping("/sale_tmpEdit")
	public String sale_tmpEdit(int id,  HttpServletRequest request) {
			request.setAttribute("flag", 2);
			request.setAttribute("sale_tmp", sale_tmpService.get(id));
		return "/admin/sale_tmpEdit";
 	}
	/**
 * Update Information
 * @param request
 * @return
 */
	@RequestMapping("/sale_tmpUpdate")
	public String sale_tmpUpdate(Sale_tmp sale_tmp, HttpServletRequest request) {
			sale_tmpService.update(sale_tmp);
			return "redirect:sale_tmpList";
 	}
	/**
 * Delete Information
 * @param request
 * @return
 */
	@RequestMapping("/sale_tmpDelete")
	public String sale_tmpDelete(int id, HttpServletRequest request) {
			sale_tmpService.delete(id);
			return "redirect:sale_tmpList";
 	}
}
