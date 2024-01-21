<%@page import="java.util.List"%>
<%@page import="product.mapper.ProductMapper"%>
<%@page import="product.domain.Product"%>
<%@page import="product.service.ProductService"%>
<%@page import="cart.Cart"%>
<%@page import="cart.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" session="true"%>


<%
/* String pNoStr = request.getParameter("p_no"); */

/* if (pNoStr == null || pNoStr.equals("")) {
   response.sendRedirect("product_form.jsp");
   return;
} */
int pNo = (int)session.getAttribute("p_no");
int size = (int)session.getAttribute("sizeSelect");

ProductService productService = new ProductService();
Product product = productService.selectProductByNo(pNo);


String u_id = (String) session.getAttribute("sUserId");
CartService cartService = new CartService();
List<Cart> cartList = cartService.cartProductAll(u_id);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<script type="text/javascript">
function addCart(pNo) {
   var selectedSize = document.getElementById('sizeSelect').value;
    var selectedQuantity = document.getElementById('quantitySelect').value;
    f.action = 
       "product_cart_add_action.jsp?selectedSize="+selectedSize+"&selectedQuantity="+selectedQuantity+"&pNo="+pNo;
   f.submit();
}
function product_cash(pNo){
   var selectedSize = document.getElementById('sizeSelect').value;
    var selectedQuantity = document.getElementById('quantitySelect').value;
    f.action = 
       "product_cash_action.jsp?selectedSize="+selectedSize+"&selectedQuantity="+selectedQuantity+"&pNo="+pNo;
   f.submit();
}
function product_info_form_sumbit(){
   var size = document.getElementById('sizeSelect').value;
   f.action = 
          "product_info_form_action.jsp";
   f.submit();
}
</script>

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
   <div class="product_container" style="margin-left: 600px;">
      <div class="product-container main-product-container">
         <div class="product-left-container">
            <!-- 각 상품에 링크 추가 -->

            <img border=0 src="images/<%=product.getP_image()%>" width=540
               height=650>

         </div>

         <div class="product-col-container">
            <p class="product-info-meta">
               <font size=2 color=#000000><%=product.getP_brand()%></font>
            </p>
            <h1 class="product-page"><%=product.getP_name()%></h1>
            <p>
               <b>상품설명</b> <br/> 
            <h7><%=product.getP_detail()%></h7>
            </p>
               <form name="f" method="post">
                  <p class="product-price">
                     <b>가격:</b> 
                     <span class="price"><%=product.getP_price()%></span> <span
                        class="product-price-meta"
                        style="float: right; font-size: 14px; text-aligin: center;">
                        <p class="product_buy">
                        <input type="hidden" name="p_no" value="<%= product.getP_no() %>">
                        사이즈: <select id="sizeSelect" name="sizeSelect" onchange="product_info_form_sumbit();"
                        >
                           <%if(size==1){ %>
                           <option value="1" selected>230mm</option>
                            <option value="2">240mm</option>
                            <option value="3">250mm</option>
                            <option value="4">260mm</option>
                            <option value="5">270mm</option>
                           <%} %>
                            <%if(size==2){ %>
                           <option value="1">230mm</option>
                            <option value="2" selected>240mm</option>
                            <option value="3">250mm</option>
                            <option value="4">260mm</option>
                            <option value="5">270mm</option>
                           <%} %>
                           <%if(size==3){ %>
                           <option value="1">230mm</option>
                            <option value="2" >240mm</option>
                            <option value="3"selected>250mm</option>
                            <option value="4">260mm</option>
                            <option value="5">270mm</option>
                           <%} %>
                           <%if(size==4){ %>
                           <option value="1">230mm</option>
                            <option value="2" >240mm</option>
                            <option value="3">250mm</option>
                            <option value="4"selected>260mm</option>
                            <option value="5">270mm</option>
                           <%} %>
                           <%if(size==5){ %>
                           <option value="1">230mm</option>
                            <option value="2" >240mm</option>
                            <option value="3">250mm</option>
                            <option value="4">260mm</option>
                            <option value="5"selected>270mm</option>
                           <%} %>
                     </select>
   
                     </span>
                  
   
                  
                  
                     수량선택: <select id="quantitySelect">
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
                     </select> </span> &nbsp;&nbsp;
                     <%
                     int productNo = product.getP_no();// 상품 번호를 JSP 변수에 저장
                     %>
                    <br> <button onclick="addCart(<%=pNo%>)">장바구니</button>
    
                     &nbsp;
   
                     <button onclick="product_cash(<%=product.getP_no()%>)">구매하기</button>
                     &nbsp; <br clear="both" />
                  </p>
                
                  
                   
                    
               </form>
        

         </div>

      </div>
      <br clear="all" />
      <div class="product-container">

       
        

      </div>

      <br clear="all" />
   </div>
</body>
</html>