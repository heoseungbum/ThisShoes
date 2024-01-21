<%@page import="org.apache.log4j.lf5.viewer.LogFactor5InputDialog"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="cart.Cart"%>
<%@page import="java.util.List"%>
<%@page import="cart.CartService"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<%
String u_id = (String) session.getAttribute("sUserId");
CartService cartService = new CartService();
List<Cart> cartList = cartService.cartProductAll(u_id);
String pNoStr = request.getParameter("p_no");
String selectedSize = request.getParameter("size");
String selectedQuantity = request.getParameter("qty");

%>
<script type="text/javascript">
function payment(){
	window.document.location="cart_cash_action.jsp";
}


function deleteCartItem(cartNo) {
      if (confirm("정말 삭제하시겠습니까?")) {
    	var f = document.getElementById("f"+cartNo);
    	f.action = "cart_delete_action.jsp";
    	f.method='POST';
    	f.submit();
    	/* f.sub top=150, left=200, scrollbars=no, resizable=no, mit(); */
        //window.location.href = "cart_delete_action.jsp?cart_no=" + cartNo;
    }
    // 여기서는 취소 버튼 클릭 시 아무 동작도 하지 않도록 처리하지 않습니다.
    
}
        


function updateQty(e, cartNo) {
    var qty = e.target.value;
    window.document.location="cart_update_action.jsp?cartNo="+cartNo+"&qty="+qty;
}


</script>
<link rel=stylesheet href="css/cart.css" type="text/css">

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

	<!-- 카트시작 -->
	<div class="basket">
		<div class="basket-labels" style="height: 55px">
			<ul>
				<li class="item item-heading">Item</li>
				<li class="price">Price</li>
				<li class="quantity">Quantity</li>
				<li class="subtotal">Subtotal</li>
			</ul>
		</div>
		<%
		for (Cart cart : cartList) {
		%>
		<div class="basket-product">
			<div class="item">
				<div class="product-image">
					<a
						href="product_info_form.jsp?p_no=<%=cart.getProduct().getP_no()%>">
						<img src="images/<%=cart.getProduct().getP_image()%>"
						class="product-frame">
					</a>
				</div>
				<div class="product-details">
					<p>
						<a
							href="product_info_form.jsp?p_no=<%=cart.getProduct().getP_no()%>"><%=cart.getProduct().getP_name()%></a>
					</p>
					<p>
						<strong><%=cart.getProduct().getP_size()%></strong>
					</p>
				</div>
			</div>
			<div class="price"><%=cart.getProduct().getP_price()%></div>
			<div class="quantity">
				<input type="number" id="cartQty<%=cart.getCart_no()%>"
					value="<%=cart.getCart_qty()%>" min="1" max="10"
					class="quantity-field"
					onchange="updateQty(event,<%=cart.getCart_no()%>)">
			</div>
			<div class="subtotal"><%=cart.getProduct().getP_price() * cart.getCart_qty()%></div>
			<div class="remove">
				<form id="f<%=cart.getCart_no()%>">
					<input type="hidden" name="cart_no" value="<%=cart.getCart_no()%>">
					<input type="hidden" name="u_id" value="<%=cart.getU_id()%>">
					<button type="button"
						onclick="deleteCartItem(<%=cart.getCart_no()%>)">Remove</button>
				</form>
			</div>
		</div>
		<%}%>
		<aside>
		<div class="summary">


			<!-- 아이템 선택 리스트 -->


			<!-- 아이템 선택 리스트 -->

			<div class="summary-checkout">
				<button class="checkout-cta" onclick="payment()">결제하기</button>
			</div>
		</div>
		<!-- 카트시작 -->
</body>
</html>