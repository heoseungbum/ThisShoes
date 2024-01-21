<%@page import="cart.Cart"%>
<%@page import="cart.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	 if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("cart_form.jsp");
		return;
	} 




// 장바구니에서 상품 삭제 후, cart_form.jsp로 redirection

// 파라미터 받기
String cartNo = request.getParameter("cart_no");
String uId = request.getParameter("u_id");
//String bol = request.getParameter("bol");


// CartService 객체 생성
CartService cartService = new CartService();

// Cart 객체 생성
Cart cartDelete = new Cart();

cartDelete.setCart_no(Integer.parseInt(cartNo));
cartDelete.setU_id(uId);
cartService.delete(cartDelete);

response.sendRedirect("cart_form.jsp");
%>