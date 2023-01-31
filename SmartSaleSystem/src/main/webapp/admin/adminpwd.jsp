<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>
<html>
  <head>
   <title>Edit Password</title>
<link href="<%=path %>/admin/layui/css/layui.css" rel="stylesheet" type="text/css" />
<script src="<%=path %>/admin/layui/layui.all.js"></script>
<link href="<%=path %>/admin/css/js/laydate.js" rel="stylesheet">
  </head>
<body >

	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;"> 
    <legend >Edit Password</legend>  
</fieldset>
  <c:if test="${not empty msg}"> 
   <script>alert('${msg}')</script>  
        </c:if>
  
    <form name="form1" class="form-horizontal" id="form1" method="post" action="<%=path %>/adminpwd">	
  <div class="layui-form-item">
	    <label class="layui-form-label">Old password:</label>
    <div class="layui-input-block">
        <input type="password" name="pwd1"   autocomplete="off" placeholder="Old Password" class="layui-input" style="width:300px" required="required" >
	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">New Password:</label>
    <div class="layui-input-block">
        <input type="password" name="pwd2"   autocomplete="off" placeholder="New Password" class="layui-input" style="width:300px" required="required" >
	    </div>
</div>
 
<div class="layui-form-item">
  <label class="layui-form-label">New Password:</label>
<div class="layui-input-block">
    <input type="password" name="pwd3"   autocomplete="off" placeholder="Re-New Password" class="layui-input" style="width:300px" required="required" >
  </div>
</div>

      
	    </div>
</div>
 
</div>
<div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">Submit</button>
    </div>
  </div>     </form>
</div>
</div>
</body>
</html>

