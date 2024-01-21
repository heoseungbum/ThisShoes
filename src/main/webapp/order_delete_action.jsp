<%@page import="order.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="order.Order"%>
<%@ page import="java.util.List" %>
<%@page import="order.OrderService"%>

<%
if (request.getMethod().equalsIgnoreCase("GET")) {
	response.sendRedirect("order_form.jsp");
	return;
}

// 파라미터 받기

String orderNo = (String)request.getParameter("order_no");
int orderNoInt = Integer.parseInt(orderNo);

// OrderService 객체 생성

OrderService orderService = new OrderService();


// 주문 항목 삭제
List<Order> orderList = orderService.orderListByOrderNo(orderNoInt);
Order order = orderList.get(0);
int rowCount = orderService.delete(order); 

// 카트 페이지로 리디렉션
response.sendRedirect("order_form.jsp");
%>
