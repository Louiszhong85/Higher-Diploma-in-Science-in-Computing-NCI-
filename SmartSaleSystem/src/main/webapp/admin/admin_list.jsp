<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>
<html>
  <head>
   <title>Admin Management</title>
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
    <legend >Admin Manage</legend>
</fieldset>
 <div class="layui-form">
  <xblock style="line-height:50px;height:50px;padding-top:2px; " >
 <form name="form1" id="form1" method="post"  action="<%=path %>/adminsearlist?ty=1">
 <div class="layui-form-pane" style="margin-top: 5px;">
<div class="layui-form-item" style="line-height:40px;height:40px">
 <label class="layui-form-label">Search Condition</label>
 <div class="layui-input-inline">
 <input type="text" name="username"   autocomplete="off" placeholder="username" class="layui-input"  >
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
       <th align="left" scope="col">Username</th>
       <th align="left" scope="col">Password</th>
        <th scope="col">Action</th>
		</tr>
	</thead>
  	<tbody>
  <c:forEach  items="${adminList}"  var="v">
		<tr>
       <td >${v.username}</td>
       <td >${v.pwd}</td>
<td>
<a  style="text-decoration:none" href="<%=path %>/adminEdit?id=${v.id}"><i class="layui-icon">&#xe642;</i></a>
  <a  style="text-decoration:none" href="<%=path %>/adminDelete?id=${v.id}" onClick="return confirm('Are you watn Delete?')"><i class="layui-icon">&#xe640;</i></a>
</td>
		  </tr>
	 </c:forEach>
     </tbody>
		      </table>
		     <br>${pageHtml}<br>
     </div>
</body>
</html>

