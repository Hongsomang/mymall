<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
table {
	margin-left:10px;
	margin-right: 10px;
	text-align: center;
	vertical-align: middle;
}

h1{
	width: 300px;
	height:100%;
	padding-top:17px;
	margin-left:20px;
	float: left;
}
hr{
	clear: both;
}
.header a{
	float: right;
	margin-right: 20px;
	padding-top: 25px;
}
.header a button{
	width: 60px;
	height: 30px;
}
.header{
	height: 70px;
	
}
div .content{
	margin-left: 20px;
	margin-right: 40px;
}
</style>
</head>
<body>
	<div>
		<div class="header">
			<h1>관리자 페이지 </h1>
			<a href="add"><button type="button">추가 </button></a>
		</div>
		<hr>
		<div class="content">
			<table class="table">
				<thead>
					<tr>
						<th>쇼핑몰 </th>
						<th>관리자 </th>
						<th>업데이트 </th>
						<th>관리 </th>
						
					</tr>
				</thead>
				<tbody>
					<c:if test="${ list.size()<1}">
						<tr>
							<td colspan="3">등록된 쇼핑몰이 없습니다.</td>
						</tr>
					</c:if>				
					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.name}</td>
							<td>${item.adminId == null ? '': item.adminId}</td>
							<td><a href="product_update/${item.id}" class="btn btn-outline-secondary">상품 업데이트 </a></td>
							<td>
								<a href="update/${item.id}" class="btn btn-outline-warning" >변경 </a> 
								<a href="delete/${item.id}" class="btn btn-outline-danger">삭제 </a>
							</td>
							
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div>
		<div>
			<a href="/"><button>홈으로 </button></a>
		</div>
	</div>
	
</body>
</html>