<%@page import="product.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
    
<%
	String sizeStr = request.getParameter("sizeSelect");
	int size=Integer.parseInt(sizeStr);
    int p_no = 0;
    int basic_pNo = (int)session.getAttribute("basic_p_no");
    p_no=basic_pNo+(size-1);
    
    session.setAttribute("p_no", p_no);
    session.setAttribute("sizeSelect", size);
    response.sendRedirect("product_info_form.jsp");
%>    
