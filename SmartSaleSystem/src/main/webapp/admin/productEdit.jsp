<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>
<html>
  <head>
   <title>Product Management</title>
<link href="<%=path %>/admin/layui/css/layui.css" rel="stylesheet" type="text/css" />
<script src="<%=path %>/admin/layui/layui.all.js"></script>
<link href="<%=path %>/admin/css/js/laydate.js" rel="stylesheet">
<script type="text/javascript">
function up()
		    {
 layer.open({
   type: 2,
 title: 'Upload',
  skin: 'layui-layer-rim', 
  area: ['420px', '340px'], 
  content: '<%=path %>/upload/upload.jsp?upname=pic'
  ,btn: ['Close'] 
 });
		    }
</script>
  </head>
<body >
   <div class="layui-form">

	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;"> 
    <legend >Product Manage</legend>  
</fieldset>
  <form name="form1" id="form1"  class="form-horizontal" method="post" action="<%=path %>/productUpdate?id=${product.id}"><div class="layui-form-item">
	    <label class="layui-form-label">Item ID:</label>
    <div class="layui-input-block">
 		 <input type="text" name="itemID" id="itemID" class="layui-input" required="required" value="${product.itemID}"  style="width:300px">	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Item Name:</label>
    <div class="layui-input-block">
 		 <input type="text" name="itemName" id="itemName" class="layui-input" required="required" value="${product.itemName}"  style="width:300px">	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Type:</label>
    <div class="layui-input-block">
 		 <input type="text" name="typeName" id="typeName" class="layui-input" required="required" value="${product.typeName}"  style="width:300px">	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Price:</label>
    <div class="layui-input-block">
 		 <input type="text" name="price" id="price" class="layui-input" required="required" value="${product.price}"  style="width:300px">	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Manufacturer:</label>
    <div class="layui-input-block">
 		 <input type="text" name="manuName" id="manuName" class="layui-input" required="required" value="${product.manuName}"  style="width:300px">	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Bar Code:</label>
    <div class="layui-input-block">
 		 <input type="text" name="barCode" id="barCode" class="layui-input" required="required" value="${product.barCode}"  style="width:300px">	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">SKU:</label>
    <div class="layui-input-block">
 		 <input type="text" name="sku" id="sku" class="layui-input" required="required" value="${product.sku}"  style="width:300px">	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Description:</label>
    <div class="layui-input-block">
 		 <input type="text" name="description" id="description" class="layui-input" required="required" value="${product.description}"  style="width:300px">	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Note:</label>
    <div class="layui-input-block">
 		 <input type="text" name="note" id="note" class="layui-input" required="required" value="${product.note}"  style="width:300px">	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Quantity:</label>
    <div class="layui-input-block">
 		 <input type="text" name="quantity" id="quantity" class="layui-input" required="required" value="${product.quantity}"  style="width:300px">	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Image:</label>
    <div class="layui-input-block">
 		 <input type="text" name="pic" id="pic"size="30"  class="layui-input" required="required" value="${product.pic}" >  		  <input type="button" value="Upload" onclick="up()"  class="layui-btn" />	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Stock Area:</label>
    <div class="layui-input-block">
 		 <input type="text" name="stockArea" id="stockArea" class="layui-input" required="required" value="${product.stockArea}"  style="width:300px">	    </div>
</div>
<div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">Submit</button>
    </div>
  </div>     </form>
</div>

