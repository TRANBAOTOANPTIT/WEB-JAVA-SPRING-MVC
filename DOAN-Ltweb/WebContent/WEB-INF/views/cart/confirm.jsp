<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<base href="${pageContext.servletContext.contextPath}/">
		<meta charset="utf-8"/>
		<title>Đơn hàng của bạn</title>
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
    		
    			<ul class="nav navbar-nav">
				<li><a href="home/man-watch/${user.username}.htm" >Đồng hồ nam</a></li>
				<li><a href="home/woman-watch/${user.username}.htm">Đồng hồ nữ</a></li>
				<li><a href="home/children-watch/${user.username}.htm">Đồng hồ trẻ em</a></li>
    		</ul>
    			<ul class="nav navbar-nav navbar-right">
    				<li><a href="cart/index/${user.username}.htm"><i class="fa fa-shopping-cart"></i> Giỏ hàng</a></li>
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

    <h4 class="text-center" style="color: darkblue;margin-top: 60px;">${message}</h4>

<div class="container" style="margin-top: 0px; background-color: white;">
    <div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
            <table class="table table-hover table-bordered table-responsive" style="margin-top: 25px;">
                <thead style="border: solid 2px blue;color:red; ">               
                    <tr>
                    	<th>STT</th>
                        <th>Mã đơn hàng</th>
                        <th>Ngày tạo</th>
                        <th class="text-center"></th>
                        <th class="text-center">Trạng thái</th>
                        <th> </th>
                    </tr>
                </thead>
                <tbody style="border-left:  solid 2px blue; border-right:  solid 2px blue ">
                	<tr>
                        <th>${status.index+1}</th>
                        <th>  ${hd.mahd}  </th>
                        <th>${hd.ngay}</th>
                        <th class="text-center"></th>
                        <th class="text-center">${hd.trangthai}</th>
                        <td class="col-sm-1 col-md-1">
                        <a href="cart/orderdelete/${hd.mahd}.htm"><button type="button" class="btn btn-danger">
                            <span class="glyphicon glyphicon-remove"></span> Huỷ
                        </button></a></td>
                   </tr>
                </tbody>
                
                <thead style="border-left:  solid 2px blue; border-right:  solid 2px blue;color:#000080;">
                    <tr>
                        <td>   </td>
                        <th>Sản phẩm</th>
                        <th>Tên sản phẩm</th>
                        <th>Số lượng</th>
                        <th class="text-center">Giá</th>
                        <th class="text-center">Số tiền</th>
                    </tr>
                </thead>
                <tbody style="border:  solid 2px blue"> 
                 <c:forEach var="c" items="${ct}" varStatus="status">                
                    <tr>
                        <td>   </td>
                    	<td>${status.index+1}</td>
                        <td class="col-sm-8 col-md-6">
	                        <div class="media">
	                            <a class="thumbnail pull-left" href="home/singleproduct/${c.product.masp}/${user.username}.htm"> <img class="media-object" src="${c.product.anhsp}" style="width: 70px; height: 70px;"> </a>
	                            <div class="media-body" style="padding-top: 20px; padding-left: 10px;">
	                                <h4 class="media-heading"><a href="home/singleproduct/${c.product.masp}/${user.username}.htm">${c.product.tensp}</a></h4>
	                            </div>
	                        </div>
                    	</td>
                        <td class="col-sm-1 col-md-1" style="text-align: center">${c.soluong}</td>
                        <td class="col-sm-1 col-md-1 text-center"><strong>${c.product.giasp} đ</strong></td>
                        <td class="col-sm-1 col-md-1 text-center" ><strong>${c.sotien} đ</strong></td>
                    </tr>
                    
				</c:forEach>
				<tr>
                        <td>   </td>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th style="color:blue;">Tổng tiền</th>
                        <th style="color:blue;">${hd.sotien} đ</th>
                    </tr>
                </tbody>  
            </table>
            
            <div class="container text-center" style="margin-bottom: 30px;">
                 <a href="home/index/${user.username}.htm"><button type="button" class="btn btn-default">
                     <span class="glyphicon glyphicon-shopping-cart"></span> Tiếp tục mua hàng
                 </button></a>                    
            </div>
        </div>
    </div>
</div>



   
	
	

</body>
</html>