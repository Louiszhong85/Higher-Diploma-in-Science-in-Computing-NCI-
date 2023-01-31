<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
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
  <form name="form1" class="form-horizontal" id="form1" method="post" action="<%=path %>/productAdd"><div class="layui-form-item">
	    <label class="layui-form-label">Item ID:</label>
    <div class="layui-input-block">
 		 <input type="text" name="itemID" id="itemID"   autocomplete="off" placeholder="Item ID" class="layui-input" style="width:300px" required="required" >
	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Item Name:</label>
    <div class="layui-input-block">
 		 <input type="text" name="itemName" id="itemName"   autocomplete="off" placeholder="Item Name" class="layui-input" style="width:300px" required="required" >
	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Type:</label>
		
		   <div class="layui-input-block" style="width:300px">
		     		  <select name="typeName" class="layui-input">
		   <c:forEach items="${productTypeList}" var="c"  varStatus="ss">
		              <option value="${c.typeName}">${c.typeName}</typeName>
		              </c:forEach>
				 </select> 
				 
		 
			    </div>
				
 
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Price:</label>
    <div class="layui-input-block">
 		 <input type="text" name="price" id="price"   autocomplete="off" placeholder="Price" class="layui-input" style="width:300px" required="required" >
	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Manufacturer:</label>
    <div class="layui-input-block">
 		 <input type="text" name="manuName" id="manuName"   autocomplete="off" placeholder="Manufacturer" class="layui-input" style="width:300px" required="required" >
	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Bar Code:</label>
    <div class="layui-input-block">
 		 <input type="text" name="barCode" id="barCode"   autocomplete="off" placeholder="Bar Code" class="layui-input" style="width:300px" required="required" >
	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">SKU:</label>
    <div class="layui-input-block">
 		 <input type="text" name="sku" id="sku"   autocomplete="off" placeholder="SKU" class="layui-input" style="width:300px" required="required" >
	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Description:</label>
    <div class="layui-input-block">
 		 <input type="text" name="description" id="description"   autocomplete="off" placeholder="Description" class="layui-input" style="width:300px" required="required" >
	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Note:</label>
    <div class="layui-input-block">
 		 <input type="text" name="note" id="note"   autocomplete="off" placeholder="Note" class="layui-input" style="width:300px" required="required" >
	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Quantity:</label>
    <div class="layui-input-block">
 		 <input type="text" name="quantity" id="quantity"   autocomplete="off" placeholder="Quantity" class="layui-input" style="width:300px" required="required" >
	    </div>
</div>
<div class="layui-form-item">
	 <label class="layui-form-label">Image:</label>
	
	       <div class="layui-input-inline"  style="width:300px" >
	    		 <input type="text" name="pic" id="pic"  size="30" class="layui-input" style="width:300px" required="required" placeholder="Image">  	</div>
	    		 <div class="layui-input-inline"  style="width:100px" >
	   		 <input type="button" value="Upload" onclick="up()"  class="layui-btn" style="width:100px" />	    </div>
	   </div>
		 
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Stock Area:</label>
    <div class="layui-input-block">
 		 <input type="text" name="stockArea" id="stockArea"   autocomplete="off" placeholder="Stock Area" class="layui-input" style="width:300px" required="required" >
	    </div>
</div>
<div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">Submit</button>
    </div>
  </div>     </form>
</div>
 </div>
 <script>
layui.use('form', function(){
   var form = layui.form,
      $ = layui.$;
   form.render();
 });
</script>
</body>
</html>

