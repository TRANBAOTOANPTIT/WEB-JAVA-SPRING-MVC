<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<base href="${pageContext.servletContext.contextPath}/">
		<meta charset="utf-8"/>
		<title>Đồng hồ nam</title>
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
    		<c:set var="user.username" value="${user.username}" scope="session"/>
    		
				<li><a href="home/man-watch/${user.username}.htm">Đồng hồ nam</a></li>
				<li><a href="home/woman-watch/${user.username}.htm">Đồng hồ nữ</a></li>
				<li><a href="home/children-watch/${user.username}.htm">Đồng hồ trẻ em</a></li>
    		</ul>
    			<ul class="nav navbar-nav navbar-right">
    				<c:choose>
    						<c:when test="${user.username==null}">
    							
    						</c:when>
    						<c:otherwise>
	    						<li><a href="cart/index/${user.username}.htm"><i class="fa fa-shopping-cart"></i> Giỏ hàng</a></li>
    						</c:otherwise>
    				</c:choose>
    					
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

    <!-- day la div menusanpham -->
    <div class="container menu-sanpham text-center" style="margin-top: 50px">
        <div class="row">
            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 menusanpham">
                <a href="home/man-watch/${user.username}.htm"><img src="images/smallimage1.png">
                <label> Đồng hồ nam <p style="font-weight: normal;font-size: 15px;color: #544D4D">196 sản phẩm<p></label>
                </a>
            </div>
            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 menusanpham">
                <a href="home/woman-watch/${user.username}.htm"><img src="images/smallimage3.jpg">
                <label> Đồng hồ nữ <p style="font-weight: normal;font-size: 15px;color: #544D4D">186 sản phẩm<p></label></a>
            </div>
            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 menusanpham">
                <a href="home/children-watch/${user.username}.htm"><img src="images/smallimage2.jpg">
                <label> Đồng hồ trẻ em<p style="font-weight: normal;font-size: 15px;color: #544D4D">115 sản phẩm<p></label></a>
            </div>
        </div>
    </div>
<!-- xong div menusanpham -->


<!-- day la div top 10 noi bat -->
<div class="container">
    <h3 style="color:#970000;font-weight:bold;font-size: 20px">Top 10 đồng hồ nam nổi bật</h3>
</div>

<div class="container productcarousel">
    <div class="row">
        <div class="MultiCarousel" data-items="1,3,5,5" data-slide="1" id="MultiCarousel"  data-interval="500">
            <div class="MultiCarousel-inner">
                
                <c:forEach var="p" begin="1" end="10" items="${productsman}">
					    <div class="item product text-center">
					        <a href="home/singleproduct/${p.masp}/${user.username}.htm">
					            <img width="180px" height="180px" data-original="${p.anhsp}" class=" lazyloaded img-responsive imgproduct" src="${p.anhsp}">                               
					              <h4 class="nameproduct" style="margin-left: 5px; margin-right: 5px;">${p.tensp}</h4>
					                <div class="priceproduct">
					                    <strong style="font-size: 16px;">${p.giasp}₫</strong>
					                 </div>                       
					         </a>    
					         <c:set var="soluong" scope="session" value="1"/>
							    <c:choose>
		    						<c:when test="${user.username==null}">
			    						<form:form action="user/login.htm">
			    							<button type="submit"  class="btn btn-default addcart">+<i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
			    						</form:form>
		    						</c:when>
		    						<c:otherwise>
			    						<form:form action="home/addtocart/${p.masp}/${user.username}/${soluong}.htm" method="post">
				    						<button type="submit"  class="btn btn-default addcart">+<i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
			    						</form:form>
		    						</c:otherwise>
		    					</c:choose>	
					         </div>
				</c:forEach>
                
            </div>
            <button class="btn btn-primary leftLst"><</button>
            <button class="btn btn-primary rightLst">></button>
        </div>
    </div>
    </div>
    

<!-- xong div top 10 noi bat -->
    <div><hr></div>

    <div class="container" style="background-color: white; padding: 20px 0px;">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                    <span style="margin-left: 25px;">Chọn mức giá:</span>
                    <a href="" style="margin-left: 15px;">Dưới 1 triệu</a>
                    <a href="" style="margin-left: 15px;">Trên 1 triệu</a>
                </div>
                
                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                    <span style="margin-right: 25px">Sắp xếp theo:</span>
                    <a href="" style="margin-right: 25px">Thấp đến cao</a>
                    <a href="" style="margin-right: 25px">Cao đến thấp</a>
                </div>
            </div>
        </div>
        <hr>
        <h4 class="text-center" style="color: brown;">ĐỒNG HỒ THỜI TRANG NAM</h4>
        <hr>

        
     			<c:forEach var="p" items="${productsman}">
					    <div class="col-xs-6 col-sm-6 col-md-3 col-lg-3">
            				<div class="item product text-center">
					        <a href="home/singleproduct/${p.masp}/${user.username}.htm">
					            <img width="180px" height="180px" data-original="${p.anhsp}" class=" lazyloaded img-responsive imgproduct" src="${p.anhsp}">                               
					              <h4 class="nameproduct" style="margin-left: 5px; margin-right: 5px;">${p.tensp}</h4>
					                <div class="priceproduct">
					                    <strong style="font-size: 16px;">${p.giasp}₫</strong>
					                 </div>                       
					         </a>    
					      <c:set var="soluong" scope="session" value="1"/>
					    <c:choose>
    						<c:when test="${user.username==null}">
	    						<form:form action="user/login.htm">
	    							<button type="submit"  class="btn btn-default addcart">+<i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
	    						</form:form>
    						</c:when>
    						<c:otherwise>
	    						<form:form action="home/addtocart/${p.masp}/${user.username}/${soluong}.htm" method="post">
		    						<button type="submit"  class="btn btn-default addcart">+<i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
	    						</form:form>
    						</c:otherwise>
    					</c:choose>	
					      </div>
					   </div>
				</c:forEach>

 </div>



   

</body>
</html>