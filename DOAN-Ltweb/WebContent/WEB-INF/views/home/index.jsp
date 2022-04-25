<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<base href="${pageContext.servletContext.contextPath}/">
		<meta charset="utf-8"/>
		<title>Trang chủ</title>
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

    <!-- day la slie discount -->
    <div class="container slidediscount">
        <div id="carousel-id" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carousel-id" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-id" data-slide-to="1" class=""></li>
            <li data-target="#carousel-id" data-slide-to="2" class=""></li>
            <li data-target="#carousel-id" data-slide-to="3" class=""></li>
        </ol>
        <div class="carousel-inner">
            <div class="item active">
                <img data-src="" alt="First slide" src="images/discount1.png">
                <div class="container">
                    <!-- <div class="carousel-caption">
                        <h1>Example headline.</h1>
                        <p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
                        <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
                    </div> -->
                </div>
            </div>
            <div class="item">
                <img data-src="" alt="Second slide" src="images/discount3.png">
                <div class="container">
                    
                </div>
            </div>
            <div class="item">
                <img data-src="" alt="Third slide" src="images/discount5.png">
                <div class="container">
                    
                </div>
            </div>

            <div class="item">
                <img data-src="" alt="Fourth slide" src="images/discount3.png">
                <div class="container">
                    
                </div>
            </div>

        </div>
        <a class="left carousel-control" href="#carousel-id" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
        <a class="right carousel-control" href="#carousel-id" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
    </div>
    </div>
<!-- end slie discount -->

<div><hr></div>

<!-- day la div menusanpham -->
<div class="container menu-sanpham text-center">
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
    <h3 style="color:#970000;font-weight:bold;font-size: 20px">Top 10 sản phẩm nổi bật</h3>
</div>

<div class="container productcarousel">
    <div class="row">
        <div class="productcarousel">   
            <div class="MultiCarousel" data-items="1,3,4,5" data-slide="1" id="MultiCarousel"  data-interval="500">
                <div class="MultiCarousel-inner">
                                
                    <c:forEach var="p" begin="1" end="10" items="${productstop}">
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
    </div>
    

<!-- xong div top 10 noi bat -->

<div><hr></div>


<!-- day la div dong ho nam -->
    <div style="background-image: url(images/banner1.jpg);background-size: auto;" class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                    <div class="text-center">
                        <h3 style="color:#970000;font-weight:bold;font-size: 20px;margin-top: 180px;">Đồng hồ nam</h3>
                        <a href="home/man-watch/${user.username}.htm" style="border: 1px solid; padding: 5px;">Xem tất cả ></a>
                    </div>
                </div>
                <div style="background-color: white; margin: 15px 0px;" class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                    <div class="productcarousel">   
                        <div class="MultiCarousel" data-items="1,3,4,5" data-slide="1" id="MultiCarousel"  data-interval="500">
                            <div class="MultiCarousel-inner">
                                
                                <c:forEach var="p" begin="1" end="10" items="${productsman}">
					                <div class="item product text-center">
					                    <a href="home/singleproduct/${p.masp}/${user.username}.htm">
					                        <img width="180" height="180" data-original="${p.anhsp}" class=" lazyloaded img-responsive imgproduct" src="${p.anhsp}">                               
					                        <h4 class="nameproduct" style="margin-left: 5px; margin-right: 5px;">${p.tensp}</h4>
					                        <div class="priceproduct">
					                            <strong style="font-size: 16px;">${p.giasp}₫</strong>
					                        </div>                       
					                    </a>    
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
                
            </div>
        </div>
    </div>
<!-- end div dong ho nam -->

<div><hr></div>


<!-- day la div dong ho nu -->
    <div style="background-image: url(images/banner2.jpg);background-size: auto;" class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                    <div class="text-center">
                        <h3 style="color:#970000;font-weight:bold;font-size: 20px;margin-top: 180px;">Đồng hồ nữ</h3>
                        <a href="home/woman-watch/${user.username}.htm" style="border: 1px solid; padding: 5px;">Xem tất cả ></a>
                    </div>
                </div>
                <div style="background-color: white; margin: 15px 0px;" class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                    <div class="productcarousel">   
                        <div class="MultiCarousel" data-items="1,3,4,5" data-slide="1" id="MultiCarousel"  data-interval="500">
                            <div class="MultiCarousel-inner">
                                
                                <c:forEach var="p" begin="1" end="10" items="${productswoman}">
					                <div class="item product text-center">
					                    <a href="home/singleproduct/${p.masp}/${user.username}.htm">
					                        <img width="180" height="180" data-original="${p.anhsp}" class=" lazyloaded img-responsive imgproduct" src="${p.anhsp}">                               
					                        <h4 class="nameproduct" style="margin-left: 5px; margin-right: 5px;">${p.tensp}</h4>
					                        <div class="priceproduct">
					                            <strong style="font-size: 16px;">${p.giasp}₫</strong>
					                        </div>                       
					                    </a>    
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
                
            </div>
        </div>
    </div>
<!-- end div dong ho nu -->

<div><hr></div>


<!-- day la div dong ho tre em -->
    <div style="background-image: url(images/banner3.jpg);background-size: auto;" class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                    <div class="text-center">
                        <h3 style="color:#970000;font-weight:bold;font-size: 20px;margin-top: 180px;">Đồng hồ trẻ em</h3>
                        <a href="home/children-watch/${user.username}.htm" style="border: 1px solid; padding: 5px;">Xem tất cả ></a>
                    </div>
                </div>
                <div style="background-color: white; margin: 15px 0px;" class="col-xs-10 col-sm-10 col-md-10 col-lg-10">
                    <div class="productcarousel">   
                        <div class="MultiCarousel" data-items="1,3,4,5" data-slide="1" id="MultiCarousel"  data-interval="500">
                            <div class="MultiCarousel-inner">
                                
                                <c:forEach var="p" begin="1" end="10" items="${productschildren}">
					                <div class="item product text-center">
					                    <a href="home/singleproduct/${p.masp}/${user.username}.htm">
					                        <img width="180" height="180" data-original="${p.anhsp}" class=" lazyloaded img-responsive imgproduct" src="${p.anhsp}">                               
					                        <h4 class="nameproduct" style="margin-left: 5px; margin-right: 5px;">${p.tensp}</h4>
					                        <div class="priceproduct">
					                            <strong style="font-size: 16px;">${p.giasp}₫</strong>
					                        </div>                       
					                    </a>    
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
                
            </div>
        </div>
    </div>
<!-- end div dong tre em -->


  
	
	

</body>
</html>