package com.util;

import java.io.UnsupportedEncodingException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

/**
 * separate tools
 */
public class PageUtil {
	
	/**
	 * 获取分页代码
	 * @param total count total page
	 * @param page  current page
	 * @param size  separate size
	 * @return
	 */
	public static String getPageHtml(HttpServletRequest request, long total, int page, int size){
		long pages = total % size ==0 ? total/size : total /size + 1;
		pages = pages==0 ? 1 : pages;
		String url = request.getRequestURL().toString();
		StringBuilder queryString = new StringBuilder();
		Enumeration<String> enumeration = request.getParameterNames();
		try { // 拼装请求参数
			while (enumeration.hasMoreElements()) {
				String element = (String) enumeration.nextElement();
				if(!element.contains("page")) { // jump page
					queryString.append("&").append(element).append("=").append(java.net.URLEncoder.encode(request.getParameter(element),"UTF-8"));
				}
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		// append separt page 
		StringBuilder buf = new StringBuilder();
		buf.append("<div style='text-align:center;'>\n");
		if (page <= 1) {
			buf.append("<a class='btn btn-default btn-sm' disabled >First Page</a>\n");
		}else{
			buf.append("<a class='btn btn-default btn-sm' href='").append(url).append("?page=").append(1).append(queryString).append("'>First Page</a>\n");
		}
		if (page <= 1) {
			buf.append("<a class='btn btn-default btn-sm' disabled >Previous</a>\n");
		}else {
			buf.append("<a class='btn btn-default btn-sm' href='").append(url).append("?page=").append(page>1 ? page-1 : 1).append(queryString).append("'>Previously</a>\n");
		}
		buf.append("<h4 style='display:inline;'>[").append(page).append("/").append(pages).append("]</h4>\n");
//		buf.append("<h2 style='display:inline;'>[").append(total).append("]</h2>\n");
		if (page >= pages) {
			buf.append("<a class='btn btn-default btn-sm' disabled >Next</a>\n");
		}else {
			buf.append("<a class='btn btn-default btn-sm' href='").append(url).append("?page=").append(page<pages ? page+1 : pages).append(queryString).append("'>Next</a>\n");
		}
		if (page >= pages) {
			buf.append("<a class='btn btn-default btn-sm' disabled >Last Page</a>\n");
		}else {
			buf.append("<a class='btn btn-default btn-sm' href='").append(url).append("?page=").append(pages).append(queryString).append("'>Last Page</a>\n");
		}
		buf.append("<input type='text' class='form-control' style='display:inline;width:60px;' value=''/> ");
		buf.append("<a class='btn btn-default btn-sm' href='javascript:void(0);' onclick='location.href=\"").append(url).append("?page=").append("\"+(this.previousElementSibling.value)+\"").append(queryString).append("\"'>GO</a>\n");
		buf.append("</div>\n");
		return buf.toString();
	}

}
