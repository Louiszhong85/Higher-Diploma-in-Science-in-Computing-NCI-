<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>
<html>
  <head>
   <title>Satff Management</title>
<link href="<%=path %>/admin/layui/css/layui.css" rel="stylesheet" type="text/css" />
<script src="<%=path %>/admin/layui/layui.all.js"></script>
<link href="<%=path %>/admin/css/js/laydate.js" rel="stylesheet">
  </head>
<body >
   <div class="layui-form">

	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;"> 
    <legend >Staff Manage</legend>  
</fieldset>
  <form name="form1" id="form1"  class="form-horizontal" method="post" action="<%=path %>/staffUpdate?id=${staff.id}"><div class="layui-form-item">
	    <label class="layui-form-label">User Name:</label>
    <div class="layui-input-block">
 		 <input type="text" name="username" id="username" class="layui-input" required="required" value="${staff.username}"  style="width:300px">	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Password:</label>
    <div class="layui-input-block">
 		 <input type="password" name="pwd" id="pwd" class="layui-input" required="required" value="${staff.pwd}"  style="width:300px">	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Name:</label>
    <div class="layui-input-block">
 		 <input type="text" name="staffName" id="staffName" class="layui-input" required="required" value="${staff.staffName}"  style="width:300px">	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Sex:</label>
    <div class="layui-input-block" style="width:300px">	
	    <select name="sex"  style="width:300px" >
		  <option value="Male">Male</option>
		 <option value="Female">Female</option>
		</select>  	
		</div>
		</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Age:</label>
    <div class="layui-input-block">
 		 <input type="text" name="age" id="age" class="layui-input" required="required" value="${staff.age}"  style="width:300px">	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Tel:</label>
    <div class="layui-input-block">
 		 <input type="text" name="tel" id="tel" class="layui-input" required="required" value="${staff.tel}"  style="width:300px">	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Add:</label>
    <div class="layui-input-block">
 		 <input type="text" name="address" id="address" class="layui-input" required="required" value="${staff.address}"  style="width:300px">	    </div>
</div>
<div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">Submit</button>
    </div>
  </div>     </form>
  <script>
  layui.use('form', function(){
     var form = layui.form,
        $ = layui.$;
     form.render();
   });
  </script>
</div>

