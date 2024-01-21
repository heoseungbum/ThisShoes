<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" session="true"%>
<%
String sUserId = (String) session.getAttribute("sUserId");
%>
<html>
<head>
<style>
div#navigation {
   font-family: 'Noto Sans KR', sans-serif;
   z-index: 1000;
   position: absolute;
   left: 250px;
   height: 220%;
   margin-left: -250px;
   overflow-y: auto;
   background: #000;
   -webkit-transition: all 0.5s ease;
   -moz-transition: all 0.5s ease;
   -o-transition: all 0.5s ease;
   transition: all 0.5s ease;
   text-align: center;
   width: 250px;
   margin-right: 10%;
   margin-top: 0px;
   margin-bottom: 0px;
   padding-top: 0%;
   padding-bottom: auto;
   margin-top: 0px;
   text-decoration-line: none;
}

.collapsible {
   background-color: black;
   color: white;
   cursor: pointer;
   padding: 18px;
   width: 100%;
   border: none;
   text-align: center;
   outline: none;
   font-size: 15px;
}

.active, .collapsible:hover {
   background-color: #555;
}

.content {
   padding: 0 18px;
   max-height: 0;
   overflow: hidden;
   transition: max-height 0.2s ease-out;
   background-color: #f1f1f1;
   text-decoration-line: none;
   
}

.content a {
   text-decoration-line: none;
   color: black;
   text-align: center;
   margin: 2px;
   margin-top: 16px;
   width: 214px;
   height: 24px;
   
}

.collapsible:after {
   content: '\002B';
   color: white;
   font-weight: bold;
   float: right;
   margin-left: 5px;
}

.active:after {
   content: "\2212";
}
</style>

<script>
   function collapse(element) {
      var before = document.getElementsByClassName("active")[0] // 기존에 활성화된 버튼
      if (before && document.getElementsByClassName("active")[0] != element) { // 자신 이외에 이미 활성화된 버튼이 있으면
         before.nextElementSibling.style.maxHeight = null; // 기존에 펼쳐진 내용 접고
         before.classList.remove("active"); // 버튼 비활성화
      }
      element.classList.toggle("active"); // 활성화 여부 toggle

      var content = element.nextElementSibling;
      if (content.style.maxHeight != 0) { // 버튼 다음 요소가 펼쳐져 있으면
         content.style.maxHeight = null; // 접기
      } else {
         content.style.maxHeight = content.scrollHeight + "px"; // 접혀있는 경우 펼치기
      }
   }
</script>
</head>

<body>
   <div class="navigation">
      <button type="button" class="collapsible" onclick="collapse(this);">
         마이페이지</button>
      <div class="content">

         <%
         //로그인된 아이디가 있는지 읽어와보기
         String id = (String) session.getAttribute("sUserId");
         %>

         <%
         if (id != null) {
         %>
         <!-- 로그인후 -->
         <p>
            <a href="user_logout_action.jsp">로그아웃</a>
         </p>
         <p>
            <a href="user_modify_form.jsp">회원수정</a>
         </p>
         <p>
            <a href="cart_form.jsp">장바구니</a>
         </p>
         <p>
            <a href="order_form.jsp">주문내역</a>
         </p>

         <!-- 로그인전 -->
         <%
         } else if (id == null) {
         %>
         <p>
            <a href="user_login_form.jsp">로 그 인</a>
         </p>
         <p>
            <a href="user_signUp_form.jsp">회원가입</a>
         </p>
         <%
         }
         %>

      </div>
      <button type="button" class="collapsible" onclick="collapse(this);">BRAND</button>
      <div class="content">
         <p><a href="product_form.jsp">전체</a></p>
         <!-- <p><a href="#">아디다스</p>
         <p><a href="#">아식스</p>
         <p><a href="#">나이키</p> -->
         <p><a href="product_form_brand_adidas.jsp">아디다스</a></p>
         <p><a href="product_form_brand_asics.jsp">아식스</a></p>
         <p><a href="product_form_brand_nike.jsp">나이키</a></p>

      </div>

   </div>
</body>
</html>