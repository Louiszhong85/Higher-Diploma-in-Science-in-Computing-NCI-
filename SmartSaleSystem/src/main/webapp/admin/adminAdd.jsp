<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>
<html>
  <head>
   <title>Admin Management</title>
<link href="<%=path %>/admin/layui/css/layui.css" rel="stylesheet" type="text/css" />
<script src="<%=path %>/admin/layui/layui.all.js"></script>
<link href="<%=path %>/admin/css/js/laydate.js" rel="stylesheet">
  </head>
<body > 
   <div class="layui-form">

	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;"> 
    <legend >Admin Manage</legend>  
</fieldset>
  <form name="form1" class="form-horizontal" id="form1" method="post" action="<%=path %>/adminAdd"><div class="layui-form-item">
	    <label class="layui-form-label">User Name:</label>
    <div class="layui-input-block">
 		 <input type="text" name="username" id="username"   autocomplete="off" placeholder="User Name" class="layui-input" style="width:300px" required="required" >
	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Password:</label>
    <div class="layui-input-block">
 		 <input type="text" name="pwd" id="pwd"   autocomplete="off" placeholder="Password" class="layui-input" style="width:300px" required="required" >
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

