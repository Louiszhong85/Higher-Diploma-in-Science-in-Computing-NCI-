<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>
<html>
  <head>
   <title>In Stock Information</title>
<link href="<%=path %>/admin/layui/css/layui.css" rel="stylesheet" type="text/css" />
<script src="<%=path %>/admin/layui/layui.all.js"></script>
<link href="<%=path %>/admin/css/js/laydate.js" rel="stylesheet">
  </head>
<body >
   <div class="layui-form">

	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;"> 
    <legend >In Stock Information</legend>  
</fieldset>
  <form name="form1" id="form1"  class="form-horizontal" method="post" action="<%=path %>/inStockUpdate?id=${inStock.id}"><div class="layui-form-item">
	    <label class="layui-form-label">Item ID:</label>
    <div class="layui-input-block">
 		 <input type="text" name="itemID" id="itemID" class="layui-input" required="required" value="${inStock.itemID}"  style="width:300px">	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Item Name:</label>
    <div class="layui-input-block">
 		 <input type="text" name="itemName" id="itemName" class="layui-input" required="required" value="${inStock.itemName}"  style="width:300px">	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">In Stock Date:</label>
    <div class="layui-input-block">
 		 <input type="text" name="inDate" id="inDate" class="layui-input" required="required" value="${inStock.inDate}"  style="width:300px">	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Quantity:</label>
    <div class="layui-input-block">
 		 <input type="text" name="quantity" id="quantity" class="layui-input" required="required" value="${inStock.quantity}"  style="width:300px">	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Price:</label>
    <div class="layui-input-block">
 		 <input type="text" name="price" id="price" class="layui-input" required="required" value="${inStock.price}"  style="width:300px">	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Operator:</label>
    <div class="layui-input-block">
 		 <input type="text" name="operator" id="operator" class="layui-input" required="required" value="${inStock.operator}"  style="width:300px">	    </div>
</div>
<div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">Submit</button>
    </div>
  </div>     </form>
</div>

