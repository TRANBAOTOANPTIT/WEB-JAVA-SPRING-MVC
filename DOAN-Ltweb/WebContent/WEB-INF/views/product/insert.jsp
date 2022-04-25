<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<base href="${pageContext.servletContext.contextPath}/">
		<meta charset="utf-8"/>
		<title>Thêm sản phẩm</title>
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
    				
    				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-user"></i> Tài khoản<span class="caret"></span></a>
						<ul class="dropdown-menu">
				         
				          <li><a href="info-user.html"><i class="fa fa-user-md"></i> Thông tin tài khoản</a></li>
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
        <h4 class="text-center">Thêm sản phẩm</h4>
        <%-- <h4 class="text-center"><img src="${product.anhsp}"/></h4> --%>
        
      <p style="color:red;">${message}</p>
        <form:form method="post" action="product/insert.htm" modelAttribute="product" enctype="multipart/form-data">
            <div class="form-group">
                <label>Tên sản phẩm:</label>
                <form:errors path="tensp" style="color:red;"/>
                <form:input path="tensp" type="text" class="form-control" placeholder="Tên sản phẩm..."/>
            </div>
            <div class="form-group">
                <label>Ảnh sản phẩm:</label>
                <form:errors path="anhsp" style="color:red;"/>
                <form:input path="anhsp" type="hidden" class="form-control" placeholder="Ảnh sản phẩm..."/>               
                <input type="file" name="photo" class="form-control" placeholder="Ảnh sản phẩm..."/>
                
            </div>
            <div class="form-group">
                <label>Loại sản phẩm:</label>
                <form:select class="form-control" path="type.maloaisp" items="${types}" itemValue="maloaisp" itemLabel="tenloaisp"></form:select>
            </div>
                
            <div class="form-group">
                <label>Giá:</label>
                <form:errors path="giasp" style="color:red;"/>
                <form:input path="giasp" type="text" class="form-control" placeholder="Giá sản phẩm..."/>
            </div>
            <div class="form-group">
                <label>Mô tả sản phẩm:</label>
                <form:errors path="motasp" style="color:red;"/>
                <form:textarea rows="5" path="motasp" type="text" class="form-control" placeholder="Mô tả sản phẩm..."/>
            </div>
            <div class="form-group">
                <label>Số lượng:</label>
                <form:errors path="soluongsp" style="color:red;"/>
                <form:input path="soluongsp" type="text" class="form-control" placeholder="Số lượng sản phẩm..."/>
            </div>
            
            <div class="form-group">
                <label>Hãng sản xuất:</label>
                <form:errors path="hangsx" style="color:red;"/>
                <form:input path="hangsx" type="text" class="form-control" placeholder="Hãng sản xuất..."/>
            </div>     
                 
            <button type="submit" class="btn btn-primary" style="margin:auto;display:block;">Thêm</button>
        </form:form>
      </div>


    </div>

	<style type="text/css">
	    .form-sec{ background:#ccc; padding:15px; background: #f8f9fa;padding: 15px;box-shadow: 0 0 4px #ccc;}
	</style>
    
     <!-- day la footer -->
    


</body>
</html>