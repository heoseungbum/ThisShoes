<%@page import="product.service.ProductService"%>
<%@page import="java.util.List"%>
<%@page import="product.domain.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" session="true"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.HashSet"%>
<%-- <% ProductService productService=new ProductService();
    List<Product> products=productService.productSelectAll();
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
            src="https://i.pinimg.com/564x/67/8c/fb/678cfbcea8dd03d0df9cd9050127b516.jpg">
      </div>
      <div class="header_event_img" style="display: none;">
         <img
            src="https://i.pinimg.com/564x/ed/63/a9/ed63a959c8416e5e2364b3e216facce8.jpg">
      </div>
      <div class="header_event_img" style="display: none;">
         <img
            src="https://i.pinimg.com/564x/bd/ff/f2/bdfff203657f8fd7555b11d14fe32a6b.jpg">
      </div>
      <button class="header_event_button_right" onClick="plusSlides(1)">
         <img src="css/image/pageNumber/Triangle_Right.png" height="20px"
            width="20px">
      </button>
   </div>
   <!-- 헤더이벤트 종료 -->

   <!-- 상품목록 시작 -->
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
   <a href="product_form_action.jsp?p_no=<%=product.getP_no()%>">
        <img src="images/<%= product.getP_image() %>" 
            alt="<%= product.getP_name() %>" class="product-image" width="150"
            height="150"/> 
            </a>
        <h2 class="product-name" style="font-size: 14px;"><%= product.getP_name() %></h2>
        <p class="product-price">
            ￦<%= product.getP_price() %></p> 
    </li> 
      <%
      productCount++;
      if (productCount >= productsPerRow) {
         productCount = 0;
      %>
      <br>
      <!-- 한 줄이 끝나면 줄 바꿈 -->
      <%
      }
      } 
      } 
      %>
   </ul>

 

   <div class="clearfix"></div>
   <!-- 상품목록 종료 -->

   

</body>
</html>