<%@page import="product.service.ProductService"%>
<%@page import="java.util.List"%>
<%@page import="product.domain.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.HashSet"%>
<%-- <%
ProductService productService = new ProductService();
List<Product> products = productService.getTwoProductsPerBrand();
%> --%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	//showSlides 배너 이벤트 클릭시 이벤트 화면전환(시작)
	var slideIndex = 1;
	showSlides(slideIndex);

	function plusSlides(n) {
		showSlides(slideIndex += n);

	}

	function showSlides(n) {
		var i;
		var slides = document.getElementsByClassName("header_event_img");
		if (n > slides.length) {
			slideIndex = 1
		}
		if (n < 1) {
			slideIndex = slides.length
		}
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		slides[slideIndex - 1].style.display = "block";
		setti
	}
	//showSlides 배너 이벤트 클릭시 이벤트 화면전환(끝)

	function showMenu(n) {
		var i;
		var menu = document.getElementsByClassName("header_event_img");
		if (n > slides.length) {
			slideIndex = 1
		}
		if (n < 1) {
			slideIndex = slides.length
		}
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		slides[slideIndex - 1].style.display = "block";
		setti
	}
</script>

<title>Shop 메인</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel=stylesheet href="css/shopFrame.css" type="text/css">


<style type="text/css" media="screen">
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
	;
</style>
</head>
<body>
	<!-- 메인 헤더  시작-->
	<jsp:include page="shop_main_header.jsp" />
	<!-- 메인 헤더  종료-->

	<!-- 왼쪽 사이드바 시작-->
	<div id="navigation">
		<!-- include_common_left.jsp start-->
		<jsp:include page="shop_main_left.jsp" />
		<!-- include_common_left.jsp end-->
	</div>
	<!-- 왼쪽 사이드바  종료-->

	<!-- 배너 이벤트 시작 -->
	<div class="header_event">
		<button class="header_event_button_left" onClick="plusSlides(-1)">
			<img src="css/image/pageNumber/Triangle_Left.png" height="20px"
				width="20px">
		</button>
		<div class="header_event_img" style="display: block;">
			<img
				src="https://www.sevenzone.com/data/editor/1904/87be0a30ce46b0bbd2579588e4dfe774_1555347801_7.jpg">
		</div>
		<div class="header_event_img" style="display: none;">
			<img
				src="https://www.lottehotel.com/content/dam/lotte-hotel/l7/hongdae/promotion/offering/3432-1440-evt-L7HD.jpg.thumb.768.768.jpg">
		</div>
		<div class="header_event_img" style="display: none;">
			<img
				src="https://www.sevenzone.com/data/editor/1901/e572decce6c64cef6e2fff058ceba4c2_1548268964_33.jpg">
		</div>
		<button class="header_event_button_right" onClick="plusSlides(1)">
			<img src="css/image/pageNumber/Triangle_Right.png" height="20px"
				width="20px">
		</button>
	</div>
	<!-- 헤더이벤트 종료 -->


	</div>

<ul class="product-list" style="text-align: center;">
    <%
    ProductService productService = new ProductService();
    List<Product> productList = productService.getTwoProductsPerBrand();

    // 중복된 상품 이름을 처리하기 위한 Set
    Set<String> uniqueProductNames = new HashSet<>();
    int productsPerRow = 3;
    int productCount = 0;

    for (Product product : productList) {
        String productName = product.getP_name();

        // 이미 해당 상품 이름이 있는 경우에는 출력하지 않음
        if (!uniqueProductNames.contains(productName)) {
            uniqueProductNames.add(productName);
    %>
    <li class="product" style="text-align: center; display: inline-table; width: 15%; padding: 5px; ">
        <img src="images/<%= product.getP_image() %>"
            alt="<%= product.getP_name() %>" class="product-image" width="230"
            height="230">
        <h2 class="product-name" style="font-size: 14px;"><%= product.getP_name() %></h2>
        <p class="product-price">
            $<%= product.getP_price() %></p> 
    </li>
    <%
            productCount++;
            if (productCount >= productsPerRow) {
                productCount = 0;
    %>
    <br> <!-- 한 줄이 끝나면 줄 바꿈 -->
    <%
            }
        }
    }
    %>
</ul>



		<div class="clearfix"></div>

		<!-- 상품목록 종료 -->





	<div class="footer">
		
	</div>

	</div>
</body>
</html>
