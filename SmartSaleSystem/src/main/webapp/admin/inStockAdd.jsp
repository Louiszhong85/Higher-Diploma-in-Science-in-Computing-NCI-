<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
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
	<script src="<%=path %>/layer/jquery.min.js"></script>
  <script src="<%=path %>/layer/layer.js"></script>
    <script src="<%=path %>/admin/js/laydate.js"></script>
  </head>
<body >
   <div class="layui-form">

	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;"> 
    <legend >In Stock Information</legend>  
</fieldset>
  <form name="form1" class="form-horizontal" id="form1" method="post" action="<%=path %>/inStockAdd"><div class="layui-form-item">
	 
	  	    <label class="layui-form-label">Item ID:</label>
	    <div class="layui-input-inline">
	   		 <input type="text" name="itemID" id="itemID"   autocomplete="off" placeholder="Item ID" class="layui-input" style="width:300px" required="required" >
	  	    </div>
	  		
	  		 <div class="layui-input-inline">
	  				 
	  				   <input type='button' value='Choose Info'  id='btn_test' class="layui-btn"/>
	  			    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Item Name:</label>
    <div class="layui-input-block">
 		 <input type="text" name="itemName" id="itemName"   autocomplete="off" placeholder="Item Name" class="layui-input" style="width:300px" required="required" >
	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">In stock Date:</label>
    <div class="layui-input-block">
 		 <input type="date" name="inDate" id="inDate"   autocomplete="off" placeholder="In Stock Date" class="layui-input" style="width:300px" required="required" >
	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Quantity:</label>
    <div class="layui-input-block">
 		 <input type="text" name="quantity" id="quantity"   autocomplete="off" placeholder="Quantity" class="layui-input" style="width:300px" required="required" >
	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Price:</label>
    <div class="layui-input-block">
 		 <input type="text" name="price" id="price"   autocomplete="off" placeholder="Price" class="layui-input" style="width:300px" required="required" >
	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Operator:</label>
    <div class="layui-input-block">
 		 <input type="text" name="operator" id="operator"   autocomplete="off" placeholder="Operator" class="layui-input" style="width:300px" readonly="readonly" value="<% out.print(session.getAttribute("username").toString() );%>" >
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
 <script type='text/javascript' src='<%=path %>/admin/layui/layui.js'></script>
 <script type='text/javascript'> 
 	$('#btn_test').on('click', function() {
 		layer.open({
 			type: 2,
 			title: 'Choose Info（Double click to chose）',
  	        btn: ['Submit', 'Cancel'],
 			area: ['800px', '330px'],
 			fixed: false,
 			content: '<%=path %>/productsearlist?ty=s',
 			yes: function(index, layero) {
 				itemID.value = $(layero).find('iframe')[0].contentWindow.user_id.value; 
 				itemName.value = $(layero).find('iframe')[0].contentWindow.user_name.value; 
				price.value = $(layero).find('iframe')[0].contentWindow.user_price.value; 
 				layer.close(index); 
 			},
 			btn2: function(index) {
 				layer.close(index);
 			},
 			success: function(layero, index) {
 				var obj = $(layero).find('iframe')[0].contentWindow;
 				
 				 $(obj.example).find('tbody tr').dblclick(function(e){
 				 	$('.layui-layer-btn0').click(); 
 				 });
 			}
 		});
 	});
 	 
 </script>
  <script>
 layui.use('form', function(){
    var form = layui.form,
       $ = layui.$;
    form.render();
  });
 </script>
 </body>
 </html>
 
 