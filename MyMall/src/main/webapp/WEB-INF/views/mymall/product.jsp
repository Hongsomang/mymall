<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" >
<style type="text/css">
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	min-width: 992px;
	font-family: "Helvetica";
}

.products {
	margin-left: auto;
	margin-right: auto;
	padding: 0;
	width: 740px;
	text-align: center;
}

.item {
	text-decoration: none;
	height: 350px;
	color: black;
	float: left;
	font-size: 11px;
}

.imagebox img {
	width: 225px;
	height: 225px;
	margin-right: 20px;
	margin-bottom: 20px;
}

div .name {
	width: 225px;
}

h1>a {
	text-decoration-line: none;
	color: black;
}
#page{
	clear:both;
}
</style>
</head>
<body>
	<div>
		<div>
			<h1>
				<a href="../main">MYMALL</a>
			</h1>
			<a href="login"><button>로그인</button></a>
		</div>
		<hr>
		<div class="products">
			<div >
				<c:if test="${list.size()<1}">
					<p>상품이 없습니다.</p>
				</c:if>
				<c:forEach var="item" items="${list }">
					<div class="item">
						<div class="imagebox">
							<a href="${item.url }" target="_blank"> <img
								alt="${item.name }" src="${item.img}">
							</a>
						</div>
						<div>
							<p class="name">${item.name }</p>
						</div>
						<div>
							<p>${item.price }</p>
						</div>
					</div>
				</c:forEach>
			</div>
			<div id="page">
				<ul class="pagination pagination-sm justify-content-center">
				<li class="page-item"><a class="page-link" href="?page=1">처음</a></li>
				<li class="page-item" ><a class="page-link" href="?page=${pager.prev }">이전</a></li>
				<c:forEach var="page" items="${ pager.list}">
					<li class="page-item"> <a class="page-link ${page eq pager.page? 'active':''  }"  href="?page=${page }">${page}</a></li> <!--eq :같으면 /pager.page: 현재페이지 -->
				</c:forEach>
				<li class="page-item"><a class="page-link" href="?page=${pager.next }">다음</a></li>
				<li class="page-item" ><a class="page-link" href="?page=${pager.last }">마지막</a></li>
			</ul> 
			</div>
		</div>
	</div>

</body>
</html>