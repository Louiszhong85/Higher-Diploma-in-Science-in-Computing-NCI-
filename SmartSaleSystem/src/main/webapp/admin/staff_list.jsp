<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>
<html>
  <head>
   <title>Staff Management</title>
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
    <legend >Staff Manage</legend>
</fieldset>
 <div class="layui-form">
  <xblock style="line-height:50px;height:50px;padding-top:2px; " >
 <form name="form1" id="form1" method="post"  action="<%=path %>/staffsearlist?ty=1">
 <div class="layui-form-pane" style="margin-top: 5px;">
<div class="layui-form-item" style="line-height:40px;height:40px">
 <label class="layui-form-label">Search Condition</label>
 <div class="layui-input-inline">
 <input type="text" name="username"   autocomplete="off" placeholder="User Name" class="layui-input"  >
  </div>
 <div class="layui-input-inline">
 <input type="text" name="staffName"   autocomplete="off" placeholder="Name" class="layui-input"  >
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
       <th align="left" scope="col">User Name</th>
       <th align="left" scope="col">Password</th>
       <th align="left" scope="col">Name</th>
       <th align="left" scope="col">Sex</th>
       <th align="left" scope="col">Age</th>
       <th align="left" scope="col">Tel</th>
       <th align="left" scope="col">Add</th>
        <th scope="col">Action</th>
		</tr>
	</thead>
  	<tbody>
  <c:forEach  items="${staffList}"  var="v">
		<tr>
       <td >${v.username}</td>
       <td >${v.pwd} </td>
       <td >${v.staffName}</td>
       <td >${v.sex}</td>
       <td >${v.age}</td>
       <td >${v.tel}</td>
       <td >${v.address}</td>
<td>
<a  style="text-decoration:none" href="<%=path %>/staffEdit?id=${v.id}"><i class="layui-icon">&#xe642;</i></a>
  <a  style="text-decoration:none" href="<%=path %>/staffDelete?id=${v.id}" onClick="return confirm('Are you want Delete?')"><i class="layui-icon">&#xe640;</i></a>
</td>
		  </tr>
	 </c:forEach>
     </tbody>
		      </table>
		     <br>${pageHtml}<br>
     </div>
</body>
</html>

