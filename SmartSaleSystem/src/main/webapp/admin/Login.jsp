<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 
 
  <meta content="yes" name="apple-mobile-web-app-capable"/>
    <meta content="yes" name="apple-touch-fullscreen"/>
    <meta content="telephone=no" name="format-detection"/>
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <title>Login Page</title>
 <link type="text/css" rel="stylesheet" href="<%=path %>/admin/css/a-designer-2.css?version=201907150916"/>
 
 
  </head>
  
<body >
 <c:if test="${not empty msg && isFlag == '1'}"> 
   <script>alert('${msg}')</script> 
        </c:if>
 <div class="page-wrap">
    <div class="page">
        <div class="nav-bar ">
            <div class="big-nav">
                <a class="logo">
                    
                    <span class="em-title">Smart Sale System</span>
                </a>
            </div>
        </div>
        <div class="page-content page-min-height">
            <div class="content-wrap">
                <div class="designer-bg" style="width: 100%;">
                    <img class="designer-fix-screen" src="<%=path %>/admin/images/login.png" alt="">
                </div>
            </div>
            <div class="content-login-wrap">
                <div class="form-wrap">
				
				
                  <form name="form1" method="post" action="<%=path %>/adminlogin">
				  
				  
                        <div class="form-hd">User Login</div>
                        <ul class="form-nav">
                            <li class="nav-name active" data-target="0"><span>User Login</span></li>
                            
                        </ul>
                        <div class="form-ele" data-target="0">
                            <div class="input-box form-control">
                                <div class="form-ele-items login-name">
                                    <label for="bidName" class="bidName">Name：</label>
                                    <input type="text" autocomplete="off" class="txt" id="username" name="username" placeholder="User name" maxlength="11">
                                </div>
                            </div>
                            <div class="input-box">
                                <div class="form-ele-items password">
                                    <label for="bidPsw" class="bidPsw">Password：</label>
                                    <input type="password" class="txt" id="pwd" name="pwd" placeholder="Password" maxlength="16">
                                </div>
                            </div>
                            <div id="validateCodeBox" class="input-box">
                                <div class="form-ele-items validate-code">
                                    <label for="validateCode" class="bidPsw">Role:</label>
									
									
								

								<select name="role"   style="border: none;    padding: 13px 0px 13px 4px;    width: 248px;" > 
								  <option value="1">Admin</option>
								   <option value="2">Staff</option>
									  					      
								</select>
                                    
 
                                </div>
                            </div>
                            <div class="input-box hover-bg-fff">
                                <div class="login-link">
                                    
                                </div>
                            </div>
                        </div>
                        <div class="login-btn-box">
                            <button class="login-btn">Login</button>
                        </div>
                        <div class="mobile-login">
                           
                        </div>   
                    </form>
                </div>
            </div>
           
        </div>
    </div>
</div>
 
 
</body>

</html>