<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>
<html>
  <head>
   <title>Product Report</title>
  <link rel='stylesheet' href='<%=path %>/admin/layui/css/layui.css'/> 
<style>
xblock{
    display: block;
    margin-bottom: 10px;
    padding: 5px;
    line-height: 22px;
    border-radius: 0 2px 2px 0;
    background-color: #f2f2f2;
}
</style>	
  </head>
<body >

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend >Product Report</legend>
</fieldset>
 <div class="layui-form">
  <xblock style="line-height:50px;height:50px;padding-top:2px; " >
 <form name="form1" id="form1" method="post"  action="<%=path %>/productsearlist?ty=t">
 <div class="layui-form-pane" style="margin-top: 5px;">
<div class="layui-form-item" style="line-height:40px;height:40px">
 <label class="layui-form-label">Search Condition</label>
 <div class="layui-input-inline">
 <input type="text" name="itemID"   autocomplete="off" placeholder="Item ID" class="layui-input"  >
  </div>
  
  
 <div class="layui-input-inline">
 <input type="text" name="itemName"   autocomplete="off" placeholder="Item Name" class="layui-input"  >
  </div>
  
  <div class="layui-input-inline">
  <input type="text" name="typeName"   autocomplete="off" placeholder="Type" class="layui-input"  >
   </div>
  <div class="layui-input-inline" style="width:80px">
   <button class="layui-btn" lay-submit="" lay-filter="demo1">Search</button>
      </div>
      </div>
      </div>
	     </xblock>
  <table id='example' class='layui-table'>
 <thead>
		<tr>
       <th align="left" scope="col">Item ID</th>
       <th align="left" scope="col">Item Name</th>
       <th align="left" scope="col">Type</th>
       <th align="left" scope="col">Price</th>
       <th align="left" scope="col">Manufacturer</th>
       <th align="left" scope="col">Bar Code</th>
       <th align="left" scope="col">SKU</th>
       <th align="left" scope="col">Description</th>
       <th align="left" scope="col">Note</th>
       <th align="left" scope="col">Quantity</th>
       <th align="left" scope="col">Image</th>
       <th align="left" scope="col">Stock Area</th>
        
		</tr>
	</thead>
  	<tbody>
		 <c:set var="sum" value="0"></c:set>
  <c:forEach  items="${productList}"  var="v">
		<tr>
       <td >${v.itemID}</td>
       <td >${v.itemName}</td>
       <td >${v.typeName}</td>
       <td >${v.price}</td>
       <td >${v.manuName}</td>
       <td >${v.barCode}</td>
       <td >${v.sku}</td>
       <td >${v.description}</td>
       <td >${v.note}</td>
      <c:if test="${v.quantity<20}"> 
		<td >
			<font color="red">${v.quantity}</font>
		</td>
		</c:if>
	  
	  <c:if test="${v.quantity>=20}">
	  		<td >
	  		 ${v.quantity} 
				</td>
	  		</c:if>
				
				
  <td >      <c:if test="${not empty v.pic}"> 
   <img src="<%=path %>/${v.pic}" class="img-rounded" style="width: 100px;height: 100px;"></c:if>
<c:if test="${empty v.pic}">No Image</c:if></td>
       <td >${v.stockArea}</td>
 
		  </tr>
		   <c:set var="sum" value="${sum+v.quantity}"></c:set>
	 </c:forEach>
     </tbody>
		      </table>
			  Total ：<font color="red">${sum }</font>
		     <br>${pageHtml}<br>
     </div>
</body>
</html>

