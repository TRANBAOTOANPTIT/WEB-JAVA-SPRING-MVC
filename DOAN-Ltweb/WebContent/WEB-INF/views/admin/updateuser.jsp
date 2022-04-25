<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<base href="${pageContext.servletContext.contextPath}/">
		<meta charset="utf-8"/>
		<title>Chỉnh sửa khách hàng</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">  
		<script type="text/javascript" src="vendor/bootstrap.js"></script>
		<script type="text/javascript" src="js/1.js"></script>
		<link rel="stylesheet" href="vendor/bootstrap.css">
		<link rel="stylesheet" href="vendor/font-awesome.css">
	 	<link rel="stylesheet" href="css/index.css">
	    <link rel="stylesheet" href="css/login.css">
   		<link rel="stylesheet" href="css/admin.css">
	    
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
    		
    			<ul class="nav navbar-nav navbar-right">
    				
    				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-user"></i> Admin<span class="caret"></span></a>
						<ul class="dropdown-menu">
				         
				          <li><a href="user/userinfo/${user.username}.htm"><i class="fa fa-user-md"></i> Thông tin tài khoản</a></li>
				          <li><a href="user/login.htm"><i class="fa fa-sign-out"></i> Đăng xuất</a></li>
				        </ul>
    				</li>
    			
    				
    			</ul>
  </div>
</nav>
    <!-- end header -->
    
    <div><hr></div>
    
    <div class="container" style="margin-top: 50px;">

    <div class="form-sec col-xs-12 col-sm-12 col-md-4 col-lg-4 col-lg-push-4 col-md-push-4">
        <h4 class="text-center">Chỉnh sửa khách hàng</h4>
        
      <p style="color:red;">${message}</p>
        <form:form name="qryform" id="qryform" method="post" action="admin/updateuser/${user.makh}.htm" modelAttribute="user">
            <form:input path="makh" class="form-control" type="hidden" name="makh"/>
            <div class="form-group">
                <label>Username:</label>
                <form:errors path="username" style="color:red;"/>
                <form:input path="username" type="text" class="form-control" placeholder="Tên đăng nhập..." name="username"/>
            </div>
          <%--   <div class="form-group">
                  <label>Password:</label>
                  <form:errors path="password" style="color:red;"/>
                  <form:input path="password" type="text" class="form-control" placeholder="Mật khẩu..." name="password"/>
            </div> --%>
                
            <div class="form-group">
                  <label>Họ:</label>
                  <form:errors path="ho" style="color:red;"/>
                  <form:input path="ho" type="text" class="form-control" placeholder="Họ..." name="ho"/>
            </div>
            <div class="form-group">
                  <label>Tên:</label>
                  <form:errors path="ten" style="color:red;"/>
                  <form:input path="ten" type="text" class="form-control" placeholder="Tên..." name="ten"/>
            </div>
            <div class="form-group">
                  <label>Địa chỉ Email:</label>
                  <form:errors path="email" style="color:red;"/>
                  <form:input path="email" type="text" class="form-control" placeholder="Địa chỉ Email..." name="email"/>
            </div>
            <div class="form-group">
                  <label>Số Điện Thoại:</label>
                  <form:errors path="sdt" style="color:red;"/>
                  <form:input path="sdt" type="text" class="form-control" placeholder="Số Điện Thoại..." name="sDT"/>
            </div>
            <div class="form-group">
                 <label>Mật khẩu</label>
                 <form:errors path="password" style="color:red;"/>
                 <form:input path="password" type="text"  class="form-control" placeholder="Mật khẩu" name="password" readonly="true"/>
             </div>
                 
            <button type="submit" class="btn btn-primary" style="margin:auto;display:block;">Cập nhật</button>
        </form:form>
      </div>


    </div>

	<style type="text/css">
	    .form-sec{ background:#ccc; padding:15px; background: #f8f9fa;padding: 15px;box-shadow: 0 0 4px #ccc;}
	</style>
    
     <!-- day la footer -->
    <div style=" margin-top: 50px"><hr></div>
    <div class="container divfooter" style="background-color: white;">
            
    
    </div>


</body>
</html>