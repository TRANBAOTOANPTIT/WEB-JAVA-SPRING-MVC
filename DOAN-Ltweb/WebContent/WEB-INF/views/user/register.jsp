<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<base href="${pageContext.servletContext.contextPath}/">
		<meta charset="utf-8"/>
		<title>Đăng ký</title>
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
    				
    				<li><a href="user/login.htm">Đăng nhập</a></li>

    				
    			</ul>
  </div>
</nav>
    <!-- end header -->

	<div class="page-section mb-60">
                <div class="container">
                    <div class="row">
                        
                        <div class="col-sm-12 col-md-12 col-lg-6 col-xs-12 col-lg-push-3">
                            <form:form action="user/register.htm" modelAttribute="user" method="POST">
                                <div class="login-form">
                                    <h4 class="login-title">Đăng ký</h4>
                                    <p style="color:brown; margin-left:15px;">${message}</p>
                                    <div class="row">
                                        <div class="col-md-6 col-12 mb-20">
                                            <label>Họ</label>
                                            <form:input class="mb-0" type="text" path="ho" placeholder="Họ và đệm"/>
                                        </div>
                                        <div class="col-md-6 col-12 mb-20">
                                            <label>Tên</label>
                                            <form:input class="mb-0" type="text" path="ten" placeholder="Tên"/>
                                        </div>
                                        <div class="col-md-12 mb-20">
                                            <label>Tên đăng nhập*</label>
                                            <form:input class="mb-0" type="text" path="username" placeholder="Tên đăng nhập"/>
                                        </div>
                                        <div class="col-md-12 mb-20">
                                            <label>Email</label>
                                            <form:input class="mb-0" type="email" path="email" placeholder="Email"/>
                                        </div>
                                        <div class="col-md-12 mb-20">
                                            <label>Số điện thoại</label>
                                            <form:input class="mb-0" type="text" path="sdt" placeholder="Số điện thoại"/>
                                        </div>
                                        <div class="col-12" style="margin-left:15px;"><p id='message'></p></div>
                                        <div class="col-md-6 mb-20">
                                        
                                            <label>Mật khẩu</label>
                                            <form:input class="mb-0" name="password" id="password" onkeyup='check();' type="password" path="password" placeholder="Mật khẩu"/>
                                        </div>
                                        <div class="col-md-6 mb-20">
                                            <label>Nhập lại mật khẩu</label>
                                            <input class="mb-0" type="password" name="confirm_password" id="confirm_password"  onkeyup='check();' placeholder="Nhập lại mật khẩu"></input>
                                        </div>
                                        <div class="col-12">
                                            <button class="register-button mt-0">Đăng ký</button>
                                        </div>
                                    </div>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
            <script type="text/javascript">
            var check = function() {
            	  if (document.getElementById('password').value == document.getElementById('confirm_password').value) {
            	    document.getElementById('message').style.color = 'green';
            	    document.getElementById('message').innerHTML = 'Mật khẩu chính xác.';
            	  } else {
            	    document.getElementById('message').style.color = 'red';
            	    document.getElementById('message').innerHTML = 'Mật khẩu chưa chính xác. Vui lòng xác nhân lại!';
            	  }
            	}
            </script>

	
		
	</body>
</html>>