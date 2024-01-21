<%@page import="user.User"%>
<%@page import="user.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%
/*
0  . GET방식요청일때 user_signUp_form.jsp로 redirection
1  . 요청객체 인코딩설정
2  . 파라메타 받기
3  . UserService객체생성
4  . UserService.create() 메쏘드실행
5-1. 아이디중복이면 user_signUp_form.jsp  
5-2. 가입성공이면   shop_main_form.jsp 로 redierction
*/

//0  . GET방식요청일때 user_signUp_form.jsp로 redirection
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("user_signUp_form.jsp");
	return;
}

//1  . 요청객체 인코딩설정 & 파라메타 받기
String userId = request.getParameter("username");
String password = request.getParameter("password");
String name = request.getParameter("name");
String email = request.getParameter("email");
int age =Integer.parseInt(request.getParameter("age"));
int phone = Integer.parseInt(request.getParameter("phone"));
String address = request.getParameter("address");



//3. UserService객체생성 & UserService.create() 메쏘드실행

User user=new User(userId,password,name,email,age,phone,address);
UserService userService = new UserService();
int result=userService.create(user);

//4. 아이디중복 체크
if(result==-1){
	//아이디 중복
			String msg2 = userId+"이미 존재하는 아이디 입니다.";
			/* 가입 성공 알림창*/
				out.println("<script>");
				out.println(" alert('"+msg2+"');");
				out.println(" location.href='user_signUp_form.jsp';");
				out.println("</script>");
	
} else{
	
			// 가입성공
				String msg1 = "가입되었습니다";
				/*가입 성공 알림창*/
					out.println("<script>");
					out.println(" alert('"+msg1+"');");
					out.println(" location.href='shop_main_form.jsp';");
					out.println("</script>");
					
		
	
}
%>