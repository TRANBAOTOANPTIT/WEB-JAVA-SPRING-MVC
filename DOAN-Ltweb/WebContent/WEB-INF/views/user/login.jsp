<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<base href="${pageContext.servletContext.contextPath}/">
		<meta charset="utf-8"/>
		<title>Đăng nhập</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">  
		<script type="text/javascript" src="vendor/bootstrap.js"></script>
		<script type="text/javascript" src="js/1.js"></script>
		<link rel="stylesheet" href="vendor/bootstrap.css">
		<link rel="stylesheet" href="vendor/font-awesome.css">
	 	<link rel="stylesheet" href="css/index.css">
	    <link rel="stylesheet" href="css/login.css">
	</head>
	<body>
		
			<!-- header -->
 <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
     <a class="navbar-brand" href="home/index.htm"><img class="logo-web" src="images/logo1.png"></a>
    </div>
 			<c:set var="timkiem" scope="session" value=""/>
    			<form class="navbar-form navbar-left" role="search" action="home/search.htm">
    				<div class="form-group">
    					<input type="text" name="timkiem" value="${timkiem}" class="form-control" placeholder="Bạn tìm gì...">
    				</div>
    				<button type="submit" class="btn btn-default">Tìm kiếm</button>
    			</form>
    		
    		</ul>
    			<ul class="nav navbar-nav navbar-right">
    				
    				<li><a href="user/register.htm">Đăng ký</a></li>

    				
    			</ul>
  </div>
</nav>
    <!-- end header -->

	<div class="page-section mb-60">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12 col-md-12 col-xs-12 col-lg-6 col-lg-push-3 mb-30">
                            <!-- Login Form s-->
                            <form:form action="user/login.htm" modelAttribute="user" method="post">
                                <div class="login-form">
                                	<p class="text-center" style="color: blue;"><a href="user/register.htm">Bạn chưa có tài khoản. Đăng ký tại đây.</a></p>
                                    <h4 class="login-title">Đăng nhập</h4>
                                    <div class="row">
                                        <div class="col-md-12 col-12 mb-20">
                                        	<p style="color:brown;">${message}</p>
                                            <label>Tên đăng nhập*</label>
                                            <form:input path="username" class="mb-0" type="text" placeholder="Tên đăng nhập"/>
                                        </div>
                                        <div class="col-12 mb-20 passwordform">
                                            <label>Mật khẩu</label>
                                            <form:input path="password" class="mb-0" type="password" value="" placeholder="Mật khẩu"/>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="check-box d-inline-block ml-0 ml-md-2 mt-10 rememberme">
                                                <div class=""><input type="checkbox" id="remember_me"></div>
                                                <div class="rememberme"><label for="remember_me">Nhớ tài khoản?</label></div>
                                                
                                            </div>
                                        </div>
                                        <div class="col-md-12 mt-10 mb-20 text-left text-md-right">
                                            <a href="user/forget.htm"> Quên mật khẩu?</a>
                                        </div>
                                        <div class="col-md-12">
                                            <button class="register-button mt-0">Đăng nhập</button>
                                        </div>
                                    </div>
                                </div>
                            </form:form>
                        </div>
                       
                    </div>
                </div>
            </div>

	<!--  footer -->

		
	</body>
</html>>