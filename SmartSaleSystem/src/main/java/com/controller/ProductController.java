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
  import com.entity.Product;
  import com.service.ProductService;
import com.util.PageUtil;
import com.util.UploadUtil;
@Controller
@RequestMapping("")
public class   ProductController {
	private static final int rows = 10;
	@Autowired
	private ProductService productService;
	/**
 * Search by condition
 * @param request
 * @return
 */
	@RequestMapping("/productsearlist")
	public String productsearlist(HttpServletRequest request) {
     String urlString = "";
     String ty = "";
    String Where = "";
String uname= request.getSession().getAttribute("username").toString();
//Operation of the query section

if (request.getParameter("itemID") == null || request.getParameter("itemID").equals("")) { }
  else { String itemID = request.getParameter("itemID").toString(); Where = Where+" and itemID like'%" + itemID + "%'"; }

if (request.getParameter("itemName") == null || request.getParameter("itemName").equals("")) { }
  else { String itemName = request.getParameter("itemName").toString(); Where = Where+" and itemName like'%" + itemName + "%'"; }

if (request.getParameter("typeName") == null || request.getParameter("typeName").equals("")) { }
else { String typeName = request.getParameter("typeName").toString(); Where = Where+" and typeName like'%" + typeName + "%'"; }


//Operation of the query section
		request.setAttribute("productList", productService.searlist(Where));
    urlString = "/admin/product_list";
	 if (request.getParameter("ty") == null||request.getParameter("ty").equals(""))
	{	return "/admin/product_list";}
else{
      ty = request.getParameter("ty").toString();
      if(ty.equals("1")){
		return "/admin/product_list";
         }
      //select parts
      if(ty.equals("s")){
    	  
    	  
  		return "/admin/product_list_s";
           }
      
      //employee part
      if(ty.equals("c")){
    	  
    	  
    		return "/admin/product_list2";
             }
      //stock
      if(ty.equals("t")){
    	  
    	  
  		return "/admin/product_list_t";
           }
   }
return urlString;

 	}
	/**
 * Get list information
 * @param request
 * @return
 */
	@RequestMapping("/productList")
	public String productList(HttpServletRequest request) {
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
		request.setAttribute("productList", productService.getList(page, rows));
		request.setAttribute("pageHtml", PageUtil.getPageHtml(request,productService.getTotal(), page, rows)); 

		return "/admin/product_list";
 	}
	/**
 * Add Information
 * @param request
 * @return
 */
	@RequestMapping("/productAdd")
	public String productAdd(Product product, HttpServletRequest request) {
			productService.add(product);
			return "redirect:productList";
 	}
	/**
 * Update Information
 * @param request
 * @return
 */
	@RequestMapping("/productEdit")
	public String productEdit(int id,  HttpServletRequest request) {
			request.setAttribute("flag", 2);
			request.setAttribute("product", productService.get(id));
		return "/admin/productEdit";
 	}
	/**
 * Update Information
 * @param request
 * @return
 */
	@RequestMapping("/productUpdate")
	public String productUpdate(Product product, HttpServletRequest request) {
			productService.update(product);
			return "redirect:productList";
 	}
	/**
 * Delete Information
 * @param request
 * @return
 */
	@RequestMapping("/productDelete")
	public String productDelete(int id, HttpServletRequest request) {
			productService.delete(id);
			return "redirect:productList";
 	}
}
