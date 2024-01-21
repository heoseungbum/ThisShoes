<%@page import="order.OrderItem"%>
<%@page import="order.Order"%>
<%@page import="order.OrderService"%>
<%@page import="org.apache.ibatis.annotations.Param"%>
<%@page import="user.User"%>
<%@page import="user.UserService"%>
<%@page import="org.apache.log4j.lf5.viewer.LogFactor5InputDialog"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="cart.Cart"%>
<%@page import="java.util.List"%>
<%@page import="cart.CartService"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%
// CartService cartService = new CartService();
//List<Cart> cartList = cartService.cartProductAll(u_id);

String userId = (String) session.getAttribute("sUserId");

// 예외 처리: 로그인한 사용자 정보가 없는 경우
if (userId == null) {
	response.sendRedirect("login.jsp"); // 로그인 페이지로 리디렉션 또는 오류 처리
	return;
}

UserService userService = new UserService();
User loginUser = userService.findUser(userId);

OrderService orderService = new OrderService();
OrderItem orderItem = new OrderItem();
List<Order> orderList = orderService.orderListById(userId);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<script type="text/javascript">
	function payment() {
		window
				.open(
						"pay_form2.jsp",
						"mypopup",
						"width=550, height=600, top=150, left=200, scrollbars=no, resizable=no, toolbars=no, menubar=no");
	}
	function deleteOrderItem(order_no) {
		if (confirm("정말 삭제하시겠습니까?")) {
			var f = document.getElementById("f" + order_no);
			f.action = "order_delete_action.jsp";
			f.method = 'POST';
			f.submit();
			//window.location.href = "cart_delete_action.jsp?cart_no=" + cartNo;
		}
		// 여기서는 취소 버튼 클릭 시 아무 동작도 하지 않도록 처리하지 않습니다.
	}
</script>
<link rel=stylesheet href="css/order.css" type="text/css">

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

	<!-- 배송지 입력 시작-->


	<div class="order_items" style="margin-left: 300px;">

		<!-- 추가 -->
		<!-- <div id="diliverly_choice">
				<div>
				<span><input type="radio" name="contact" value="email" checked />집 
				</span>
				</div>			
			
				<div>
				<span>
				<input type="radio" name="contact" value="email" checked />회사
				</span>
				</div>
				
		</div> -->

		<!-- 추가 -->
		<p style="text-align: left; font-weight: bold; font-size: 15px;">
			&nbsp;주소:&nbsp;<span><%=loginUser.getU_address()%></span>
		</p>

		<p style="text-align: left; font-weight: bold; font-size: 15px;">
			&nbsp;이름:&nbsp;<span><%=loginUser.getU_name()%></span>
		</p>

		<!--  
              배송요청사항
              
		<p id="diliverly_msg"
			style="text-align: left; font-weight: bold; font-size: 15px;">
			&nbsp;배송요청사항:&nbsp; <br> <select style="width: 500px;">
				<option>배송전 연락바랍니다.</option>
				<option>부재시 경비실에 맡겨주세요.</option>
				<option>부재시 연락주세요.</option>
				<option>빠른 배송 부탁드려요.</option>
			</select>
		</p>
		<br>
		<textarea id="textarea" placeholder="배송시 요청사항을 입력해주세요 (최대 50자)"></textarea>
		 -->
	</div>
	<!-- 배송지 입력 종료-->
	<!-- 카트시작 -->

	<div class="basket">
		<div class="basket-labels" style="height: 55px">
			<ul>
				<li class="item item-heading">Item</li>
				<li class="price">Price</li>
				<li class="quantity">Quantity</li>
				<li class="subtotal">Total Price</li>
			</ul>
		</div>
		<%
		for (Order order : orderList) {
			String image = order.getOrderItemList().get(0).getProduct().getP_image();
			int quantity = order.getOrderItemList().get(0).getOi_qty(); // 주문 항목의 수량을 가져옴
			int price = order.getO_price(); // 주문 항목의 가격을 가져옴
			int total = quantity * price; // 가격과 수량을 곱한 값 계산

			//int rinkNo = order.getOrderItemList().get(0).getProduct().getP_no();
		%>
		<div class="basket-product">
			<div class="item">
				<div class="product-image">
					<a
						href="order_link_action.jsp?p_no=<%=order.getOrderItemList().get(0).getProduct().getP_no()%>">
						<img src="images/<%=image%>" class="product-frame">
					</a>
				</div>
				<div class="product-details">

					<p>
						<a
							href="order_link_action.jsp?p_no=<%=order.getOrderItemList().get(0).getProduct().getP_no()%>">
							<%=order.getO_desc()%>
							</a>
					</p>
					<p>
						<strong></strong>
					</p>
				</div>
			</div>
			<div class="price"><%=order.getO_price()%></div>
			<div class="quantity"><%=quantity%></div>
			<div class="total"><%=total%></div>
			<!-- Total Price 표시 -->
			<div class="remove">
				<form id="f<%=order.getO_no()%>">
					<input type="hidden" name="order_no" value="<%=order.getO_no()%>">
					<input type="hidden" name="u_id" value="<%=order.getU_id()%>">
					<button type="button"
						onclick="deleteOrderItem('<%=order.getO_no()%>', '<%=order.getU_id()%>')">Remove</button>
				</form>
			</div>
		</div>
		<%
}
%>

		<!--
		<aside>
		<div class="summary">
			<div class="summary-total-items">
				<span class="total-items"></span> Items in your Bag
			</div>
			<div class="summary-subtotal">
				<div class="subtotal-title">Subtotal</div>
				<div class="subtotal-value final-value" id="basket-subtotal">130.00</div>
				<div class="summary-promo hide">
					<div class="promo-title">Promotion</div>
					<div class="promo-value final-value" id="basket-promo"></div>
				</div>
			</div>

			 아이템 선택 리스트 

			<div class="summary-item">
				<div class="summary-total-items">
					<p style="text-align: left; font-weight: bold; font-size: 10px;">
						&nbsp;상품명:<span>아주예쁜신발</span>
					</p>
					<br> <a style="text-align: right">수량:</a><span>n개</span> <a
						style="text-align: right">가격: <span>원</span></a> &nbsp;&nbsp;<br>
				</div>
			</div>

			<div class="summary-item">
				<div class="summary-total-items">
					<p style="text-align: left; font-weight: bold; font-size: 10px;">
						&nbsp;상품명:<span>아주예쁜신발</span>
					</p>
					<br> <a style="text-align: right">수량:</a><span>n개</span> <a
						style="text-align: right">가격: <span>원</span></a> &nbsp;&nbsp;
				</div>
			</div>



			 아이템 선택 리스트 

			<div class="summary-total">
				<div class="total-title">Total</div>
				<div class="total-value final-value" id="basket-total">130.00</div>
			</div>
			<div class="summary-checkout">
				<button class="checkout-cta" onclick="payment()">결제하기</button>
			</div>
		</div>
		-->
		<!-- 카트시작 -->
</body>
</html>