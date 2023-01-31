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
  import com.entity.IeAccount;
  import com.service.IeAccountService;
import com.util.PageUtil;
import com.util.UploadUtil;
@Controller
@RequestMapping("")
public class   IeAccountController {
	private static final int rows = 10;
	@Autowired
	private IeAccountService ieAccountService;
	/**
 * Search by condition
 * @param request
 * @return
 */
	@RequestMapping("/ieAccountsearlist")
	public String ieAccountsearlist(HttpServletRequest request) {
     String urlString = "";
     String ty = "";
    String Where = "";
String uname= request.getSession().getAttribute("username").toString();
//Operation of the query section

if (request.getParameter("ieDate") == null || request.getParameter("ieDate").equals("")) { }
  else { String ieDate = request.getParameter("ieDate").toString(); Where = Where+" and ieDate like'%" + ieDate + "%'"; }

if (request.getParameter("ieType") == null || request.getParameter("ieType").equals("")) { }
  else { String ieType = request.getParameter("ieType").toString(); Where = Where+" and ieType like'%" + ieType + "%'"; }
//Operation of the query section
		request.setAttribute("ieAccountList", ieAccountService.searlist(Where));
    urlString = "/admin/ieAccount_list";
	 if (request.getParameter("ty") == null||request.getParameter("ty").equals(""))
	{	return "/admin/ieAccount_list";}
else{
      ty = request.getParameter("ty").toString();
      if(ty.equals("1")){
		return "/admin/ieAccount_list";
         }
   }
return urlString;

 	}
	/**
 * Get list information
 * @param request
 * @return
 */
	@RequestMapping("/ieAccountList")
	public String ieAccountList(HttpServletRequest request) {
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
		request.setAttribute("ieAccountList", ieAccountService.getList(page, rows));
		request.setAttribute("pageHtml", PageUtil.getPageHtml(request,ieAccountService.getTotal(), page, rows)); 

		return "/admin/ieAccount_list";
 	}
	/**
 * add info
 * @param request
 * @return
 */
	@RequestMapping("/ieAccountAdd")
	public String ieAccountAdd(IeAccount ieAccount, HttpServletRequest request) {
			ieAccountService.add(ieAccount);
			return "redirect:ieAccountList";
 	}
	/**
 * Update Information
 * @param request
 * @return
 */
	@RequestMapping("/ieAccountEdit")
	public String ieAccountEdit(int id,  HttpServletRequest request) {
			request.setAttribute("flag", 2);
			request.setAttribute("ieAccount", ieAccountService.get(id));
		return "/admin/ieAccountEdit";
 	}
	/**
 * Update Information
 * @param request
 * @return
 */
	@RequestMapping("/ieAccountUpdate")
	public String ieAccountUpdate(IeAccount ieAccount, HttpServletRequest request) {
			ieAccountService.update(ieAccount);
			return "redirect:ieAccountList";
 	}
	/**
 * Delete Information
 * @param request
 * @return
 */
	@RequestMapping("/ieAccountDelete")
	public String ieAccountDelete(int id, HttpServletRequest request) {
			ieAccountService.delete(id);
			return "redirect:ieAccountList";
 	}
}
