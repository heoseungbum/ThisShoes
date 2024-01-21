<%@page import="java.util.List"%>
<%@page import="product.mapper.ProductMapper"%>
<%@page import="product.domain.Product"%>
<%@page import="product.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>


 <%
    String pNoStr = request.getParameter("p_no");
    if (pNoStr == null || pNoStr.equals("")) {
        response.sendRedirect("test_product_form.jsp");
        return;
    }
    int pNo = Integer.parseInt(pNoStr); // 수정된 부분
    ProductService productService = new ProductService();
    Product product = productService.selectProductByNo(pNo);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
	;
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/product_info.css" type="text/css">
<link rel=stylesheet href="css/shopFrame.css" type="text/css">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,800"
	type="text/css">
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

<!-- productsList를 반복하여 각 상품에 대한 정보를 표시하는 부분 -->
 <div class="product_container" style=" margin-left: 600px;">
    <div class="product-container main-product-container">
        <div class="product-left-container">
            <!-- 각 상품에 링크 추가 -->
          
                <img border=0 src="images/<%=product.getP_image()%>" width=540 height=650>
            
        </div>

			<div class="product-col-container">
				<p class="product-info-meta"><font size=2 color=#000000><%=product.getP_brand() %></font></p>
				<h1 class="product-page"><%=product.getP_name()%></h1>
				<p>
					<b>상품설명</b> <br /> 어쩌구 저쩌구~~~~~~~~
				</p>

				<p class="product-price">
					<b>가격:</b> <span class="old-price"><%=product.getP_price() %></span> <span
						class="price"><%=product.getP_price() %></span> <span class="product-price-meta"
						style="float: right; font-size: 14px; text-aligin: center;">
						사이즈: <select>
							<option value="1">230mm</option>
							<option value="2">240mm</option>
							<option value="3">250mm</option>
							<option value="4">260mm</option>
							<option value="5">270mm</option>
					</select>

					</span>
				</p>

				<p class="product_buy">
					<span class="quantity">수량선택: <select>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
					</select>
					</span> &nbsp;&nbsp;
					<button>장바구니</button>
					&nbsp;
					
					<button onclick="location.href='pay_form2.jsp'">구매하기</button> &nbsp;
					<br clear="both" />
				</p>

				<p>[social sharing]</p>

			</div>

		</div>
		<br clear="all" />
		<div class="product-container">

			<div class="product-left-container">
				<h2 class="product-page">상세정보</h2>
				<p class="product-body">어쩌구~~~~~~</p>
			</div>

			<div class="product-col-container">Col</div>

		</div>

		<br clear="all" />
	</div>
</body>
</html>