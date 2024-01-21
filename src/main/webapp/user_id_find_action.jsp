<%@page import="org.apache.ibatis.reflection.MetaObject"%>
<%@page import="user.UserService"%>
<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%
/* if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("user_login_form.jsp");
	return;
} */
//1  . 요청객체 인코딩설정 & 파라메타 받기


String name = request.getParameter("name");
int phone = Integer.parseInt(request.getParameter("phone")); 
UserService userService = new UserService();
String userId = userService.findUserId(name, phone); // 메서드 한 번만 호출

session.setAttribute("findUserId", userId);
response.sendRedirect("user_login_form.jsp");

//out.println(" alert('"+userId+"');");
/* out.println("<script>");
out.println(" alert('"+msg+"');");
out.println(" location.href='user_login_form.jsp';");
out.println("</script>"); */


%>  