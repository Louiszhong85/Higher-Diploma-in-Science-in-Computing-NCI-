<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>
<html>
  <head>
   <title>In Stock Information</title>
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
    <legend >In Stock Information</legend>
</fieldset>
 <div class="layui-form">
  <xblock style="line-height:50px;height:50px;padding-top:2px; " >
 <form name="form1" id="form1" method="post"  action="<%=path %>/inStocksearlist?ty=1">
 <div class="layui-form-pane" style="margin-top: 5px;">
<div class="layui-form-item" style="line-height:40px;height:40px">
 <label class="layui-form-label">Search Condition</label>
 <div class="layui-input-inline">
 <input type="text" name="itemID"   autocomplete="off" placeholder="Item ID" class="layui-input"  >
  </div>
 <div class="layui-input-inline">
 <input type="text" name="itemName"   autocomplete="off" placeholder="Item Name" class="layui-input"  >
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
       <th align="left" scope="col">In stock Date</th>
       <th align="left" scope="col">Quantity</th>
       <th align="left" scope="col">Price</th>
       <th align="left" scope="col">Operator</th>
        <th scope="col">Operation</th>
		</tr>
	</thead>
  	<tbody>
  <c:forEach  items="${inStockList}"  var="v">
		<tr>
       <td >${v.itemID}</td>
       <td >${v.itemName}</td>
       <td >${v.inDate}</td>
       <td >${v.quantity}</td>
       <td >${v.price}</td>
       <td >${v.operator}</td>
<td>
<a  style="text-decoration:none" href="<%=path %>/inStockEdit?id=${v.id}"><i class="layui-icon">&#xe642;</i></a>
  <a  style="text-decoration:none" href="<%=path %>/inStockDelete?id=${v.id}" onClick="return confirm('Are you want delete?')"><i class="layui-icon">&#xe640;</i></a>
</td>
		  </tr>
	 </c:forEach>
     </tbody>
		      </table>
		     <br>${pageHtml}<br>
     </div>
</body>
</html>

