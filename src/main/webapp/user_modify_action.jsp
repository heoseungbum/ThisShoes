<%@page import="user.User"%>
<%@page import="user.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@include file="user_login_check.jspf" %>

<%



/*
0.login 여부체크
1.GET방식이면 user_main.jsp redirection
2.요청객체인코딩설정
3.파라메타받기(password,name,email)
4.세션의 sUserId와 파라메타(password,name,email) 로 User객체생성후  UserService.update 메쏘드호출
5.성공:user_view.jsp redirection
  실패:user_error.jsp 
*/
try{
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("user_login_form.jsp");
		return;
	}
	
	String userId = request.getParameter("username");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	  int age = 0;
	    int phone = 0;
	    
	    try {
	        age = Integer.parseInt(request.getParameter("age"));
	        phone = Integer.parseInt(request.getParameter("phone"));
	    } catch (NumberFormatException e) {
	        // 나이나 전화번호 입력이 잘못되었을 때 처리
	        throw new Exception("나이나 전화번호를 올바르게 입력해주세요.");
	    }
	String address = request.getParameter("address");
	
	UserService userService=new UserService();
	int rowCount=userService.update(new User(userId,password,name,email,age,phone,address));

	if(rowCount==0){
		throw new Exception("ㅎ..망");
	}
	response.sendRedirect("user_modify_form.jsp");
	session.setAttribute(userId, "sUserId");
	
}catch(Exception e){
	e.printStackTrace();
	String msg1 = "잘못된 접근입니다.";
	out.println("<script>");
	out.println(" alert('"+msg1+"');");
	out.println(" location.href='user_modify_form.jsp';");
	out.println("</script>");

}


%>
