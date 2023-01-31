<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>
<html>
  <head>
   <title>Sale Management</title>
<link href="<%=path %>/admin/layui/css/layui.css" rel="stylesheet" type="text/css" />
<script src="<%=path %>/admin/layui/layui.all.js"></script>
<link href="<%=path %>/admin/css/js/laydate.js" rel="stylesheet">
	<script src="<%=path %>/layer/jquery.min.js"></script>
  <script src="<%=path %>/layer/layer.js"></script>
    <script src="<%=path %>/admin/js/laydate.js"></script>
  </head>
<body >
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;"> 
    <legend >Sale POSE system</legend>  
</fieldset>
   <div class="layui-form" style="  display: flex;  justify-content: space-between;width:1300px" >



   
   
   <div style="width:40%;float:left;display: inline-block">
  <form name="form1" class="form-horizontal" id="form1" method="post" action="<%=path %>/sale_tmpAdd"><div class="layui-form-item">
	  <label class="layui-form-label">Item ID:</label>
	  <div class="layui-input-inline">
	  	 <input type="text" name="itemID" id="itemID"   autocomplete="off" placeholder="Item ID" class="layui-input" style="width:300px" required="required" >
	      </div>
	  	
	  	 <div class="layui-input-inline">
	  			 
	  			   <input type='button' value='Select Info'  id='btn_test' class="layui-btn"/>
	  		    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Item Name:</label>
    <div class="layui-input-block">
 		 <input type="text" name="itemName" id="itemName"   autocomplete="off" placeholder="Item Name" class="layui-input" style="width:300px" required="required" >
	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Sale Date:</label>
    <div class="layui-input-block">
 		 <input type="date" name="saleDate" id="saleDate"   autocomplete="off" placeholder="Sale Date" class="layui-input" style="width:300px" required="required" >
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
  
  
  
 <div style="width:55%;dispay:inline-block;padding-top:-30px ">
  <form name="form1" id="form1" method="post"  action="<%=path %>/jiesuan">
  
  <table id='example' class='layui-table'>
 <thead>
		<tr>
       <th align="left" scope="col">Item ID</th>
       <th align="left" scope="col">Item Name</th>
       <th align="left" scope="col">Sale Date</th>
       <th align="left" scope="col">Quantity</th>
       <th align="left" scope="col">Price</th>
       <th align="left" scope="col">Operator</th>
        <th scope="col">Action</th>
		</tr>
	</thead>
  	<tbody>
  	<c:set var="sum" value="0"></c:set>
  <c:forEach  items="${sale_tmpList}"  var="v">
		<tr>
       <td >${v.itemID}</td>
       <td >${v.itemName}</td>
       <td >${v.saleDate}</td>
       <td >${v.quantity}</td>
       <td >${v.price}</td>
       <td >${v.operator}</td>
        <c:set var="sum" value="${sum+v.price*v.quantity}"></c:set>
<td>
 
  <a  style="text-decoration:none" href="<%=path %>/sale_tmpDelete?id=${v.id}" onClick="return confirm('Are you want delete?')"><i class="layui-icon">&#xe640;</i></a>
</td>
		  </tr>
		   
		
	 </c:forEach>
	   <tr>
	   <td colspan=7> <front color=red>Total：${sum }</front></td>
		
		  </tr>  
		  <tr>
	   <td colspan=7> <button class="layui-btn" lay-submit="" lay-filter="demo1">Pay</button></td>
		
		  </tr>  
     </tbody>
		      </table>
			  </div>  
			  
			  
			  </from>
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
 			title: 'Double Click to Select',
  	        btn: ['Submit', 'Cancel'],
 			area: ['800px', '330px'],
 			fixed: false,
 			content: '<%=path %>/productsearlist?ty=s',
 			yes: function(index, layero) {
 				itemID.value = $(layero).find('iframe')[0].contentWindow.user_id.value; //将子窗口中的 user_id 抓过来
 				itemName.value = $(layero).find('iframe')[0].contentWindow.user_name.value; //将子窗口中的 user_id 抓过来
 		      price.value = $(layero).find('iframe')[0].contentWindow.user_price.value; //将子窗口中的 user_id 抓过来
 				layer.close(index); //关闭弹窗
 			},
 			btn2: function(index) {
 				layer.close(index);
 			},
 			success: function(layero, index) {
 				var obj = $(layero).find('iframe')[0].contentWindow;
 				//定义表格行的双击处理
 				 $(obj.example).find('tbody tr').dblclick(function(e){
 				 	$('.layui-layer-btn0').click(); //触发'确定'按钮单击事件
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
 
 