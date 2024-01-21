<%@page import="java.util.List"%>
<%@page import="product.domain.Product"%>
<%@page import="product.service.ProductService"%>
<%@page import="product.service.ProductServiceImpl"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.HashSet"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>


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
</script>

<title>Shop 메인</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
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

	<!-- 카테고리 삽입 -->

	<!-- 헤더이벤트 종료 -->

	<!-- 상품목록 시작 -->


	<div class="products">


	<div class="category">
    <ul class="category_list">
        <li><a href="product_form.jsp"><img
                    src="images/Nike Dunk Low Retro SE Industrial Blue.png"
                    style="max-width: 110px; height: auto;"> </a> <br> <span
                style="font-size: 20px;">전체상품</span></li>
        <li><a href="product_form_brand_adidas.jsp"><img
                    src="images/Adidas Gazelle Indoor Bliss Pink.png"
                    style="max-width: 110px; height: auto;"> </a> <br> <span
                style="font-size: 20px;">아디다스</span></li>
        <li><a href="product_form_brand_asics.jsp"><img
                    src="images/Asics Gel-Venture 6 SPS Birch French Blue.png"
                    style="max-width: 110px; height: auto;"> </a> <br> <span
                style="font-size: 20px;">아식스</span></li>
        <li><a href="product_form_brand_nike.jsp"><img
                    src="images/Nike Air VaporMax 2023 Flyknit Pure Platinum.png"
                    style="max-width: 110px; height: auto;"> </a> <br> <span
                style="font-size: 20px;">나이키</span></li>
    </ul>
</div>


		<div class="search">
			<input type="text" class="searchTerm">
			<button type="button" class="searchButton">
				<img src="css/image/search.png" alt="대체 텍스트" onclick=""
					style="width: 20px; height: 20px; text-align: center; margin-bottom: 0px;">
			</button>
		</div>
	</div>

<ul class="product-list" style="text-align: center;">
    <%
    ProductServiceImpl productService = new ProductServiceImpl();
    List<Product> productList = productService.selectProductByBrand("아디다스");

    // 중복된 상품 이름을 처리하기 위한 Set
    Set<String> uniqueProductNames = new HashSet<>();
    int productsPerRow = 4;
    int productCount = 0;

    for (Product product : productList) {
        String productName = product.getP_name();

        // 이미 해당 상품 이름이 있는 경우에는 출력하지 않음
        if (!uniqueProductNames.contains(productName)) {
            uniqueProductNames.add(productName);
    %>
    <li class="product" style="text-align: center; display: inline-table; width: 15%; padding: 5px; ">
    <a href="test_product_info_form.jsp?p_no=<%=product.getP_no()%>">
        <img src="images/<%= product.getP_image() %>"
            alt="<%= product.getP_name() %>" class="product-image" width="150"
            height="150"></a>
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
			<a href="#"><img src="css/image/pageNumber/one.png"></a> <a
				href="#"><img src="css/image/pageNumber/two.png"></a> <a
				href="#"><img src="css/image/pageNumber/three.png"></a>
		</div>
</body>
</html>
