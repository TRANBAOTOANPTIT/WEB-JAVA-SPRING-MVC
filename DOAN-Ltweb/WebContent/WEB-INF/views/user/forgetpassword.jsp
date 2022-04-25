<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<base href="${pageContext.servletContext.contextPath}/">
		<meta charset="utf-8"/>
		<title>Quên mật khẩu</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">  
		<script type="text/javascript" src="vendor/bootstrap.js"></script>
		<script type="text/javascript" src="js/1.js"></script>
		<link rel="stylesheet" href="vendor/bootstrap.css">
		<link rel="stylesheet" href="vendor/font-awesome.css">
	 	<link rel="stylesheet" href="css/index.css">
	    <link rel="stylesheet" href="css/login.css">
	</head>
	
	<style type="text/css">
        
    input.hidden {
        position: absolute;
        left: -9999px;
    }

    #profile-image1 {
        cursor: pointer;
      
         width: 100px;
        height: 100px;
        border:2px solid #03b1ce ;}
        .tital{ font-size:16px; font-weight:500;}
         .bot-border{ border-bottom:1px #f8f8f8 solid;  margin:5px 0  5px 0}    

</style>
	
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
    		
    				<ul class="nav navbar-nav navbar-right">
    				<li class="dropdown">
    				
    					<c:choose>
    						<c:when test="${user.username==null}">
    							<a href="user/login.htm"> Đăng nhập</a>
    						</c:when>
    						<c:otherwise>
	    						<a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-user"></i> ${user.username}<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="cart/order/${user.username}.htm"><i class="fa fa-reorder"></i> Đơn hàng</a></li>
						          <li><a href="user/userinfo/${user.username}.htm"><i class="fa fa-user-md"></i> Thông tin tài khoản</a></li>
						          <li><a href="home/logout.htm"><i class="fa fa-sign-out"></i> Đăng xuất</a></li>
						        </ul>
    						</c:otherwise>
    					</c:choose>
    					
    				</li>

    				
    			</ul>

  </div>
</nav>
    <!-- end header -->

    <div><hr></div>
	<div class="container" style="margin-top: 50px;">
	
	
	<div class="col-md-4 col-md-push-4" style="background: white; ">
	<div class="text-center">
		<h3 style="color:darkblue;">Quên mật khẩu</h3>
		<p style="color:red;">${message}</p>
	</div>
	
				<c:set var="username" scope="session" value=""/>
    			<form action="user/forgetpass.htm">
    				<div class="form-group">
    				<h4 class="text-center" style="margin-top: 20px;margin-bottom: 10px;">Nhập username</h4>
    					<input type="text" name="username" value="${username}" class="form-control" placeholder="Username...">
    				</div>
    				<button type="submit" class="btn btn-primary" style="margin:auto;display:block; margin-top: 10px; margin-bottom: 30px;">Lấy mật khẩu</button>
    			</form>
    </div>
	</div>
	

	
	

</body>
</html>