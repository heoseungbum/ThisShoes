<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
	function find(){
		document.f.action = "user_find_pass_action.jsp";
		documemt.f.method='POST';
		document.f.submit();
	}
	
</script>
<title>Shop 메인</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign Up Form</title>

<link rel="stylesheet"	href="https://codepen.io/gymratpacks/pen/VKzBEp#0">

<link href='https://fonts.googleapis.com/css?family=Nunito:400,300'	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/find.css">
</head>
<!-- 헤드종료 -->

<body>
	<div class="row">
		<div class="col-md-12">
			<form name="f">
				<h1>비밀번호 찾기</h1>

				<fieldset>
					<!-- 이름  -->
					<label for="userid">아이디:</label> 
					<input type="text" id="userid" name="userid"> 
					
					<!-- 전화번호  -->
					<label for="phone">전화번호:</label> 
					<input type="text" id="phone" name="phone">
					
				</fieldset>

				<button onclick="find()">찾기</button>
			</form>
		</div>
	</div>

</body>
</html>