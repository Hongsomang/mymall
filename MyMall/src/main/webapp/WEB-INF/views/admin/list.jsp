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
			<h1>관리자 페이지 </h1>
			<a href="add"><button type="button">추가 </button></a>
		</div>
		<hr>
		<div>
			<table border="1">
				<thead>
					<tr>
						<th>쇼핑몰 </th>
						<th>관리자 </th>
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
							<td>
								<a href="/update/${item.name}">변경 </a> 
								<a href="/delete/${item.name}">삭제 </a>
							</td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div>
	</div>
	
</body>
</html>