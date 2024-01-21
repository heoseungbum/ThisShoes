<%@page import="user.UserService"%>
<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%

	User user1 = new User();
   UserService userService = new UserService();
   String sUserId = (String)session.getAttribute("sUserId");
   User user = userService.findUser(sUserId);//회원상세보기
%>  

<html>
<!-- 헤드시작 -->
<head>
<script type="text/javascript">
/* function onlyNumber(){
	   if((event.keyCode > 48 && event.keyCode < 57 ) 
	      || event.keyCode == 8 //backspace
	      || event.keyCode == 37 || event.keyCode == 39 //방향키 →, ←
	      || event.keyCode == 46 \\delete키
	      || event.keyCode == 39){
	   }else{
	   event.returnValue=false;
	   }
	} */
	
function userModify() {
		
		 if (document.row.password.value == "") {
			alert("비밀번호를 입력하십시요.");
			document.row.password.focus();
			return false;
		}
		if (document.row.name.value == "") {
			alert("이름을 입력하십시요.");
			row.name.focus();
			return false;
		}
		if (document.row.email.value == "") {
			alert("이메일 주소를 입력하십시요.");
			row.email.focus();
			return false;
		}
		if (document.row.age.value == "") {
			alert("나이를 입력하십시요.");
			row.email.focus();
			return false;
		}
		if (document.row.address.value == "") {
			alert("주소를 입력하십시요.");
			row.email.focus();
			return;
		}
		if (document.row.phone.value == "") {
			alert("전화번호를 입력하십시요.");
			row.email.focus();
			return false;
		}

		document.row.action = "user_modify_action.jsp";
		document.row.method='POST';
		document.row.submit();
	}


</script>
<title>Shop 메인</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign Up Form</title>

<link rel="stylesheet"	href="https://codepen.io/gymratpacks/pen/VKzBEp#0">

<link href='https://fonts.googleapis.com/css?family=Nunito:400,300'	rel='stylesheet' type='text/css'>
<link rel=stylesheet href="css/shopFrame.css" type="text/css">
<link rel="stylesheet" href="css/signUp.css">
</head>
<!-- 헤드종료 -->

<body>
	<!-- 메인 헤더  시작-->
	<jsp:include page="shop_main_header.jsp" />
	<!-- 메인 헤더  종료-->

	<!-- 왼쪽 사이드바 시작-->
	<div id="navigation">
		<!-- include_common_left.jsp start-->
		<jsp:include page="shop_main_left.jsp" />
		<!-- include_common_left.jsp end-->
	</div>
	<!-- 왼쪽 사이드바  종료-->

	<div class="row">
		<div class="col-md-12">
		 	<form name="row">
				<h1>회 원 수 정</h1>

				<fieldset>


					<!-- 이름  -->
					<label for="name">아이디:</label> 
					<input type="text" id="username" name="username" value="<%= user.getU_id()%>" readonly> 
					
					<!-- 비번  -->
					<label for="password">비밀번호:</label>
					<input type="text" id="password" name="password" value="<%= user.getU_pass()%>">

					<!-- 이름  -->
					<label for="name">이름:</label> 
					<input type="text" id="name" name="name" value="<%= user.getU_name()%>"style="width: 50px"> 
					
					<!-- 이메일  -->
					<label for="email">이메일:</label> 
					<input type="email" id="email" name="email" value="<%= user.getU_email()%>">
					
					<!-- 나이  -->
					<label for="age">나이:</label> 
					<input type="text" id="age" name="age" style="width: 50px"	value="<%= user.getU_age()%>">
					
					<!-- 전화번호  -->
					<label for="phone">전화번호:</label> 
					<input type="text" id="phone" name="phone" value="<%= user.getU_phone()%>"
					onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" >

					<!-- 주소  -->
					<label for="address">주소:</label> 
					<input type="text" id="address" name="address" value="<%= user.getU_address()%>">

				</fieldset>
				<button type="button" onclick="userModify();">수 정</button>

			</form>
		</div>
	</div>

</body>
</html>