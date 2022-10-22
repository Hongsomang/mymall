<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<div>
			<h1>MYMALL</h1>
			<a href="login"><button>로그인</button></a>
		</div>
		<hr>
		<div>
			<ul>
				<c:if test="${list.size()<1}">
					<li>상품이 없습니다.</li>
				</c:if>
			<c:forEach var="item" items="${list }">
				<div>
					<div>
						<a href="${item.url }" target="_blank">
							<img alt="${item.name }" src="${item.img}">
						</a>
					</div>
					<div>
						<p>${item.name }</p>
					</div>
					<div>
						<p>${item.price }</p>
					</div>
				</div>
			</c:forEach>
			</ul>
		</div>
	</div>
	
</body>
</html>