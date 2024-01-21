<%@page import="product.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
    
<%
	String pNoStr = request.getParameter("p_no");
	int pNo=Integer.parseInt(pNoStr);
	int size = 1;
	
    session.setAttribute("p_no", pNo);
    session.setAttribute("basic_p_no", pNo);
    session.setAttribute("sizeSelect", size);
    response.sendRedirect("product_info_form.jsp");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>