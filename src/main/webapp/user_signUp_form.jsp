<%@page import="user.User"%>
<%@page import="user.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>
<!-- 헤드시작 -->
<head>
<script type="text/javascript">

function userCreate() {
	if (document.row.username.value == "") {
		alert("사용자 아이디를 입력하십시요.");
		document.row.username.focus();
		return;
	}
	 if (document.row.password.value == "") {
		alert("비밀번호를 입력하십시요.");
		document.row.password.focus();
		return;
	}
	if (document.row.name.value == "") {
		alert("이름을 입력하십시요.");
		row.name.focus();
		return;
	}
	if (document.row.email.value == "") {
		alert("이메일 주소를 입력하십시요.");
		row.email.focus();
		return;
	}
	if (document.row.age.value == "") {
		alert("나이를 입력하십시요.");
		row.email.focus();
		return;
	}
	if (document.row.address.value == "") {
		alert("주소를 입력하십시요.");
		row.email.focus();
		return;
	}
	if (document.row.phone.value == "") {
		alert("전화번호를 입력하십시요.");
		row.email.focus();
		return;
	}

	document.row.action = "user_signUp_action.jsp";
	document.row.method='POST';
	document.row.submit();
}

  function idCheck() {	 
	    var username = document.getElementById("username").value;
	    if (username === "") {
	        alert("아이디를 입력하시오.");
	        return;
	    }
	    sessionStorage.setItem("signup_username", username);

	    location.href = "user_idCheck_action.jsp?username=" + encodeURIComponent(username);
	    
}  

  
</script>
<title>Shop 메인</title>

<meta charset="UTF-8">
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

	<div class="row" >
		<div class="col-md-12">
			
			
			<form name="row" method="post" action="user_idCheck_action.jsp">
				<h1>회 원 가 입</h1>

				<fieldset>


					<!-- 이름  -->
					<label for="name">아이디:</label>
						<a>
							<input type="text" id="username" name="username" style="width: 335px;"> &nbsp;
							<input type="button" value="중복체크" onclick="idCheck()">
						</a>
						
					<!-- 비번  -->
					<label for="password">비밀번호:</label>
					<input type="password" id="password" name="password">

					<!-- 이름  -->
					<label for="name">이름:</label> 
					<input type="text" id="name" name="name" style="width: 50px"> 
					
					<!-- 이메일  -->
					<label for="email">이메일:</label> 
					<input type="email" id="mail" name="email">
					
					<!-- 나이  -->
					<label for="age">나이:</label> 
					<input type="text" id="age" name="age" style="width: 50px"	value="20">살 
					
					<!-- 전화번호  -->
					<label for="phone">전화번호:</label> 
					<input type="text" id="phone" name="phone" 
					onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" >

					<!-- 주소  -->
					<label for="address">주소:</label> 
					<input type="text" id="address" name="address">

		
				</fieldset>

				<button type="button" onclick="userCreate();">회원가입</button>

			</form>
			
		</div>
	</div>

</body>
</html>