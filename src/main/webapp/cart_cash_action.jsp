<%@page import="user.User"%>
<%@page import="user.UserService"%>
<%@page import="order.OrderItem"%>
<%@page import="java.util.ArrayList"%>
<%@page import="product.domain.Product"%>
<%@page import="java.util.List"%>
<%@page import="order.Order"%>
<%@page import="order.OrderService"%>
<%@page import="cart.Cart"%>
<%@page import="cart.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	CartService cartService = new CartService();
	OrderService orderService = new OrderService();
	UserService userService = new UserService(); 
	
	String u_id = (String)session.getAttribute("sUserId");
	List<Cart> cartList = cartService.cartProductAll(u_id);
	User user = userService.findUser(u_id);
	ArrayList<OrderItem> orderItemList = new ArrayList<OrderItem>();		
	int totalPrice = 0;
	for(Cart cart : cartList){
		Product product = cart.getProduct();
		int cartQty = cart.getCart_qty();
        int pPrice = product.getP_price();
        totalPrice += cartQty * pPrice;
        orderItemList.add(new OrderItem(0, cartQty, 0, product.getP_no(),product));
        cartService.delete(cart);
	}
	Order order = new Order(0,null,null,totalPrice,user.getU_address(),u_id,orderItemList);
	orderService.addOrder(order);
	
	response.sendRedirect("order_form.jsp");
	
	
%>
