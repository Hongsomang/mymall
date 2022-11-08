<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${sessionScope.user != null}">
		
		 
		<p> ${sessionScope.user.name} 님의 마이페이지입니다.</p>
	</c:if>
	<c:if test="${sessionScope.user == null}">
		<p>  세션 없음 </p>
	</c:if>
	
	<a href="logout"> 로그아웃 </a>
</body>
</html>