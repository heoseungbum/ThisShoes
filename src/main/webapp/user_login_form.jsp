
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
	
<%
	String findUserId = (String)session.getAttribute("findUserId");	
	if(findUserId==null){
		findUserId = "";
	}
%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel=stylesheet href="css/login.css" type="text/css">
<script type="text/javascript">


function userCreateForm() {
	location.href = "user_write_form.jsp";
}

function login() {
	if (document.f.username.value == "") {
		alert("사용자 아이디를 입력하십시요.");
		document.f.userId.focus();
		return;
	}
	if (document.f.password.value == "") {
		alert("비밀번호를 입력하십시요.");
		f.password.focus();
		return;
	}

	document.f.action = "user_login_action.jsp";
	document.f.method='POST';
	document.f.submit();
}


function findId(){
  window.open("user_find_Id_form.jsp", "mypopup", "width=550, height=600, top=150, left=200, scrollbars=no, resizable=no, toolbars=no, menubar=no");
	}
	
function findPass(){
  window.open("user_find_pass_form.jsp", "mypopup", "width=550, height=600, top=150, left=200, scrollbars=no, resizable=no, toolbars=no, menubar=no");
	}


</script>
</head>
<body class="align">
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
	

	<div class="grid">
		<div>
		<h1 style="text-align: center">
		<img src="css/image/login.png" height="100px" width="100px">
		</h1>
		</div>

		<form name = "f" action="https://httpbin.org/post" method="POST"
			class="form login">

			<div class="form__field">
				
				<label for="login__username">
					 
					
					<span class="hidden">Username</span>
				</label>

				<input autocomplete="username" id="login__username" type="text"
					   name="username" value = "<%=findUserId%>" class="form__input" placeholder="Username" required>
			</div>

			<div class="form__field">

				<label for="login__password">
				<svg class="icon"> <use
						xlink:href="#icon-lock"></use> </svg><span class="hidden">Password</span></label>
				<input id="login__password" type="password" name="password" value = ""
					   class="form__input" placeholder="Password" required>
			</div>

			<div class="form__field">
				<input type="submit" value="로그인"	onClick="login();">
			</div>

		<div class="form__field">
				<input type="submit" value="아이디 찾기" style="color:black;" onClick="findId()">
				<input type="submit" value="비밀번호 찾기"	onClick="findPass()">
				<a href="user_signUp_form.jsp"><input type="submit" value=" 회원가입" onclick="location.href='user_signUp_form.jsp'"></a>
		</div>
		</form>

	</div>

</body>
</html>