<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%
    String sUserId = (String) session.getAttribute("sUserId");
%>

<link rel=stylesheet href="css/shopFrame.css" type="text/css">
<!-- header -->
<div style="width:1250px" align="center">
    <div class="topbar">
        <a class="logo" href="shop_main_form.jsp"> <img src="logo/logo.png" height="40px">
        </a>
        <ul>
            <li><a href="shop_main_form.jsp">Shop</a></li>
            <li><a href="cart_form.jsp">Cart</a></li>
            <!-- 로그인 후 -->
            <% if (sUserId != null) { %>
            <li><a href="user_logout_action.jsp">Logout</a></li>
            <!-- 로그인 전 -->
            <% } else if(sUserId == null){ %>
            <!--  <li><a href="cart_form.jsp">Cart</a></li> 로그인 전에 카트 없어야?-->
            <li><a href="user_login_form.jsp" style="  padding-top: 20px;">Login</a></li>
            <% } %>
        </ul>
    </div>
</div>
<!-- header --> 