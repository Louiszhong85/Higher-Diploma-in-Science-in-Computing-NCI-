<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>
<html>
  <head>
   <title>Sale and Income Management</title>
<link href="<%=path %>/admin/layui/css/layui.css" rel="stylesheet" type="text/css" />
<script src="<%=path %>/admin/layui/layui.all.js"></script>
<link href="<%=path %>/admin/css/js/laydate.js" rel="stylesheet">
  </head>
<body >
   <div class="layui-form">

	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;"> 
    <legend >Sale and Income Management</legend>  
</fieldset>
  <form name="form1" id="form1"  class="form-horizontal" method="post" action="<%=path %>/ieAccountUpdate?id=${ieAccount.id}"><div class="layui-form-item">
	    <label class="layui-form-label">Date:</label>
    <div class="layui-input-block">
 		 <input type="text" name="ieDate" id="ieDate" class="layui-input" required="required" value="${ieAccount.ieDate}"  style="width:300px">	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Type:</label>
    <div class="layui-input-block">
 		 <input type="text" name="ieType" id="ieType" class="layui-input" required="required" value="${ieAccount.ieType}"  style="width:300px">	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Amount:</label>
    <div class="layui-input-block">
 		 <input type="text" name="amount" id="amount" class="layui-input" required="required" value="${ieAccount.amount}"  style="width:300px">	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Note:</label>
    <div class="layui-input-block">
 		 <input type="text" name="note" id="note" class="layui-input" required="required" value="${ieAccount.note}"  style="width:300px">	    </div>
</div>
<div class="layui-form-item">
	    <label class="layui-form-label">Operator:</label>
    <div class="layui-input-block">
 		 <input type="text" name="operator" id="operator" class="layui-input" required="required" value="${ieAccount.operator}"  style="width:300px">	    </div>
</div>
<div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">Submit</button>
    </div>
  </div>     </form>
</div>

