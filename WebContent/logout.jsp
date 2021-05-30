<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
<%

session.invalidate();
response.sendRedirect("main.jsp");
%>

</script>
</head>
<body>

</body>
</html>