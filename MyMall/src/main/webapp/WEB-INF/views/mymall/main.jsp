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
	<div>
		<div>
			<h1>MYMALL</h1>
			<a><button>로그인</button></a>
		</div>
		<hr>
		<div>
			<input type="text" name="search">
			<button>검색</button>
		</div>
		<div>
			<ul>
				<c:if test="${list.size()<1 }">
					<li>
						<div>
							<p>쇼핑몰일 없습니다.</p>
						</div>
					</li>
				</c:if>
				<c:forEach var="item" items="${list}">
					<li>
						<div style="border: 1px solid #000;">
							<p>${item.name }</p>
							<p>${item.content }</p>
							<p><a href="${item.url }">홈페이지로 이동 </a></p>
							<span></span>
						</div>
					</li>
				</c:forEach>

			</ul>
		</div>
	</div>
</body>
</html>