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
			<a href="login"><button>로그인</button></a>
		</div>
		<hr>
		<div>
			<form >
				<div>
				<input type="text" name="search" value="${pager.search}" placeholder="쇼핑몰 이름을 입력하세요.">
				<button>검색</button>
				</div>
			</form>
		</div>
		<div>
			<ul>
				<c:if test="${list.size()<1 }">
					<li>
						<div>
							<p>쇼핑몰이 없습니다.</p>
						</div>
					</li>
				</c:if>
				<c:forEach var="item" items="${list}">
					<li>
						<div style="border: 1px solid #000;">
							<p>${item.name }</p>
							<p>${item.content }</p>
							<p>
								<a href="${item.url }" target="_blank">홈페이지로 이동 </a>
							</p>
							<span></span>
						</div>
					</li>
				</c:forEach>

			</ul>
		</div>
	</div>
</body>
</html>