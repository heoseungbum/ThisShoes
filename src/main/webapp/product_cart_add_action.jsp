<%@page import="product.service.ProductService"%>
<%@page import="product.domain.Product"%>
<%@page import="cart.Cart"%>
<%@page import="cart.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
    
<%
    String u_id = (String)session.getAttribute("sUserId");
    String sizeStr = request.getParameter("selectedSize");
    String qtyStr = request.getParameter("selectedQuantity");
    String p_noStr = request.getParameter("pNo");
    int size = Integer.parseInt(sizeStr); 
    int qty = Integer.parseInt(qtyStr);
    int p_no = Integer.parseInt(p_noStr);
    
    ProductService productService = new ProductService();
    Product product = productService.selectProductByNo(p_no);
    CartService cartService = new CartService();
    Cart cart = cartService.findCartByIdWithNo(new Cart(0,0,u_id,null));
    cart = new Cart(cart.getCart_no(),qty,cart.getU_id(),product);
    cartService.addCart(cart);
    
    response.sendRedirect("cart_form.jsp");
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