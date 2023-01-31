<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>
<html>
  <head>
   <title>Info Select</title>
      <link href="<%=path %>/admin/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link rel='stylesheet' href='<%=path %>/admin/layui/css/layui.css'/>
  </head>
<body >
 
 
<table id='example' class='layui-table'>
 <thead>
		<tr>
			<th align="left" scope="col">Item ID</th>
			<th align="left" scope="col">Item Name</th>
			<th align="left" scope="col">Type</th>
			<th align="left" scope="col">Price</th>
			<th align="left" scope="col">Manufacturer</th>
			<th align="left" scope="col">Bar Code</th>
			 
		 
			<th align="left" scope="col">Quantity</th>
		 
			</tr>
				</thead>
			  	<tbody>
			 <c:forEach  items="${productList}"  var="v">
							 <tr onclick="user_id.value='${v.itemID}';user_name.value='${v.itemName}';user_price.value='${v.price}'">
			    <td >${v.itemID}</td>
			           <td >${v.itemName}</td>
			           <td >${v.typeName}</td>
			           <td >${v.price}</td>
			           <td >${v.manuName}</td>
			           <td >${v.barCode}</td>
			        
			       
			           <td >${v.quantity}</td>
			    
			    
			 
					  </tr>
				 </c:forEach>
			     </tbody>
					      </table>
				 
			Item ID <input id='user_id' value='' type='text'  >
			Item Name<input id='user_name' value='' type='text'  >    
		 Price<input id='user_price' value='' type='text'  >  
			   
			</body>
			</html>
