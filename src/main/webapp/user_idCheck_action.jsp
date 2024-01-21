<%@page import="user.User"%>
<%@page import="user.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<%
try {
    String username = request.getParameter("username");

    if (username != null && !username.isEmpty()) {
        session.setAttribute("signup_username", username); // 세션에 저장
        UserService userService = new UserService();
        int result = userService.countByUserId(username);
        if (result == 1) {
            out.println("<script>");
            out.println(" alert('이미 존재하는 아이디입니다.');");
            out.println("</script>");
        } else {
            out.println("<script>");
            out.println(" alert('사용 가능한 아이디입니다.');");
            out.println("</script>");
        }
    } else {
        out.println("<script>");
        out.println(" alert('아이디를 입력하세요.');");
        out.println("</script>");
    }
} catch (Exception e) {
    out.println("<script>");
    out.println(" alert('에러 발생: " + e.getMessage() + "');");
    out.println("</script>");
}
%>

</body>
</html>