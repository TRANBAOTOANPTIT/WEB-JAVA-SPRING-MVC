<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<base href="${pageContext.servletContext.contextPath}/">
		<meta charset="utf-8"/>
		<title>Quản lý Sản phẩm</title>
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
				         
				         
				          <li><a href="user/login.htm"><i class="fa fa-sign-out"></i> Đăng xuất</a></li>
				        </ul>
    				</li>

    				
    			</ul>
  </div>
</nav>
    <!-- end header -->
    <div><hr></div>

<h2 class="text-center" style="color: darkblue;margin-top: 50px;">QUẢN LÝ WEBSITE</h2>
    
<div class="container main-container" >
<div class="col-md-2 sidebar">
    <div class="row">
        <div class="" style="margin-left: 30px; margin-bottom: 15px; font-size: 16px;"><a href="home.html"><i class="glyphicon glyphicon-home"></i></a> / Admin / Quản lý sản phẩm</div>
    <!-- uncomment code for absolute positioning tweek see top comment in css -->
    <div class="absolute-wrapper"> </div>
    <!-- Menu -->
    <div class="side-menu">
        <nav class="navbar navbar-default" role="navigation">
            <!-- Main Menu -->
            <div class="side-menu-container">
                <ul class="nav navbar-nav">
                    <li><a href="admin/user.htm"><span class="glyphicon glyphicon-user"></span> Quản lý khách hàng</a></li>
                    <li class="active"><a href="product/index.htm"><span class="glyphicon glyphicon-lock"></span> Quản lý sản phẩm</a></li>
                    <li><a href="order/index.htm"><span class="glyphicon glyphicon-paste"></span> Quản lý đơn hàng</a></li>

                    <!-- Dropdown-->
                    <li class="panel panel-default" id="dropdown">
                        <a data-toggle="collapse" href="#dropdown-lvl1">
                            <span class="glyphicon glyphicon-user"></span> Tài khoản <span class="caret"></span>
                        </a>

                        <!-- Dropdown level 1 -->
                        <div id="dropdown-lvl1" class="panel-collapse collapse">
                            <div class="panel-body">
                                <ul class="nav navbar-nav">
                                   
                                    <li><a href="user/login.htm"><i class="fa fa-sign-out"></i> Đăng xuất</a></li>
           
                                </ul>
                            </div>
                        </div>
                    </li>

               

                </ul>
            </div>
        </nav>

    </div>
</div>         
 </div>
        <div class="col-md-10 content">
              <div class="panel panel-default">
    <div class="panel-heading text-center" style="font-size: 20px;">
        Quản lý Sản Phẩm
    </div>


    <div class="panel-body ">
        <div>
            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 col-lg-push-4">
                <a  href="product/index.htm" class="btn btn-default"><i class="glyphicon glyphicon-repeat"></i> Làm mới</a>
                <a  href="product/insert.htm" class="btn btn-primary"><i class="glyphicon glyphicon-plus"></i> Thêm sản phẩm</a>
                <div><hr></div> 
            </div>
           
    </div>
        
            
      <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <table class="table table-responsive table-hover table-bordered ">
        <thead>
          <tr class="" style="background-color: #008080;">
          	<th>STT</th>
          	<th>Mã SP</th>
            <th>Ảnh</th>
            <th>Tên</th>
            <th>Giá</th>
            <th>Mô tả</th>
            <th>Ngày tạo</th>
            <th>SL</th>
            <th>Loại sản phẩm</th>
            <th>Hãng sản xuất</th>
            <th></th>
            <th></th>
          </tr>
        </thead>
        <tbody>
	        <c:forEach var="p" items="${products}" varStatus="status">
	          <tr>
	          	<td>${status.index+1}</td>
	          	<td>${p.masp}</td>
	            <td><img src="${p.anhsp}" alt="${p.tensp}" style="max-height: 80px; max-width: 80px;"/></td>
	            <td>${p.tensp}</td>
	            <td>${p.giasp}</td>
	            <td><p style="height:70px;width:90px;border:1px solid #ccc;overflow:auto;">${p.motasp}</p></td>
	            <td>${p.ngaytaosp}</td>
	            <td>${p.soluongsp}</td>
	            <td>${p.type.tenloaisp}</td>
	            <td>${p.hangsx}</td>
	            <td><a href="product/delete/${p.masp}.htm" class="btn btn-danger" onclick="return confirm('Bạn có chắc chắn muốn xoá ${p.tensp}?');"><i class="glyphicon glyphicon-remove"></i> Xoá</a></td>
	            <td><a href="product/update/${p.masp}.htm" class="btn btn-info"><i class="glyphicon glyphicon-pencil"></i> Sửa</a></td>
	          </tr>
	        </c:forEach> 
        </tbody>
      </table>
            
        </div>
    
    </div>


</div>
</div>
</div>

    <script type="text/javascript">
	       
        $(function () {
            $('.navbar-toggle-sidebar').click(function () {
                $('.navbar-nav').toggleClass('slide-in');
                $('.side-body').toggleClass('body-slide-in');
                $('#search').removeClass('in').addClass('collapse').slideUp(200);
            });

            $('#search-trigger').click(function () {
                $('.navbar-nav').removeClass('slide-in');
                $('.side-body').removeClass('body-slide-in');
                $('.search-input').focus();
            });
        });
    </script>
    
        <!-- day la footer -->
    <div style=" margin-top: 50px"><hr></div>
    <div class="container divfooter" style="background-color: white;">
            



</body>
</html>