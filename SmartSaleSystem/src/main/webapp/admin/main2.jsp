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
     <link href="<%=path %>/admin/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="<%=path %>/admin/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="<%=path %>/admin/css/animate.min.css" rel="stylesheet">
    <link href="<%=path %>/admin/css/style.min.css?v=4.0.0" rel="stylesheet"> 
    <script src="<%=path %>/admin/js/jquery.js"></script> 
 
  </head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>   
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                           
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold">
                               	<% 
		 out.print(session.getAttribute("role").toString() );
		 	%>
								</strong></span>
                                <span class="text-muted text-xs block">
                               	<% 
		 out.print(session.getAttribute("username").toString() );
		 	%>
			<b class="caret"></b></span>
                                </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                
                                <li><a class="J_menuItem" href='<%=path %>/admin/adminpwd.jsp' target="right">Change Password</a>
                                </li>
                                
                                 
                                <li class="divider"></li>
                                <li><a  href="<%=path %>/logout" >Logout</a>
                                </li>
                            </ul>
                        </div>
                        <div class="logo-element">H+
                        </div>
                    </li>

                     <li>
                        <a class="J_menuItem" href="<%=path %>/admin/main2.jsp"><i class="fa fa-home"></i> <span class="nav-label">Main</span></a>
                    </li>

                      

						<li>
							<a href="#"><i class="fa fa-user-secret"></i> <span class="nav-label">Sale Management</span><span
									class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a class="J_menuItem" href='<%=path %>/admin/saleAdd.jsp' target="right">Create Sale</a> </li>
								<li><a class="J_menuItem" href='<%=path %>/salesearlist?ty=y' target="right">Sale Manage</a> </li>

							</ul>
						</li>
                     


                
<li>
					    <a href="#">
					        <i class="fa fa-balance-scale"></i>
					        <span class="nav-label">Item Search</span>
					        <span class="fa arrow"></span>
					    </a>
					    <ul class="nav nav-second-level">
					    <li><a class="J_menuItem"  href='<%=path %>/productsearlist?ty=c' target=right>Item Search</a>  </li>
					 
					    </ul> 
					</li>
                    
					 
					 <li>
					     <a href="#">
					         <i class="fa fa fa-user"></i>
					         <span class="nav-label">Profile Management</span>
					         <span class="fa arrow"></span>
					     </a>
					     <ul class="nav nav-second-level">
					 
					     <li><a class="J_menuItem" href='<%=path %>/staffinfo' target=right>Profile Manage</a>  </li>
					     </ul> 
					 </li>
                    
				 
					 
                     <li>
                        <a href="#"><i class="fa fa-user-secret"></i> <span class="nav-label">Change Password</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                         <li><a class="J_menuItem" href='admin/xpwd.jsp'target="right">Change Password</a> </li>
                          
                        </ul>
                    </li>
					
				 
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
		
		 <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
               <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0;background-color: #2f4050;" > 
                    <div class="navbar-header" style="color: #FFF;">
                    
                    <div style="padding-top: 10px;padding-left: 50px;font-size: 24px;">
                    The Smart Sale System
                    </div>
                       
                    </div>
                    <ul class="nav navbar-top-links navbar-right">
                     
               
                        <li class="dropdown hidden-xs">
                            <a class="right-sidebar-toggle" aria-expanded="false" href="<%=path %>/logout" >
                                <i class="fa fa fa-sign-out"></i> Logout
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:;" class="active J_menuTab" data-id="welcome.aspx">Main</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">Close<span class="caret"></span>

                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>Locate Section</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>Close All</a>
                        </li>
                        <li class="J_tabCloseOther"><a>Close Other Section</a>
                        </li>
                    </ul>
                </div>
                <a  href="<%=path %>/logout"  class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> Logout</a>
            </div>
            <div class="row J_mainContent" id="content-main" style="background-color:#FFF;">
                <iframe class="J_iframe" name="right" width="100%" height="100%" src="<%=path %>/admin/welcome.jsp" frameborder="0" data-id="welcome.jsp" seamless></iframe>
            </div>
            <div class="footer">
                <div class="pull-right">&copy; 2022    The Smart Sale System
                </div>
            </div>
        </div>
        <!--右侧部分结束-->
 
<div style="text-align:center;">
 </div>
     <script src="<%=path %>/admin/js/jquery.min.js?v=2.1.4"></script>
    <script src="<%=path %>/admin/js/bootstrap.min.js?v=3.3.5"></script>
    
    
    <script src="<%=path %>/admin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="<%=path %>/admin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="<%=path %>/admin/js/plugins/layer/layer.min.js"></script>
    
    
    <script src="<%=path %>/admin/js/hplus.min.js?v=4.0.0"></script>
    <script type="text/javascript" src="<%=path %>/admin/js/contabs.min.js"></script>
    <script src="<%=path %>/admin/js/plugins/pace/pace.min.js"></script>
</body>

</html>