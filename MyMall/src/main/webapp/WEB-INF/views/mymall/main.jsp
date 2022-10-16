<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.bi-star {
	font-size: 30px;
	line-height: 30px;
	color: #f8f820;
}

.bi-star-fill {
	font-size: 30px;
	line-height: 30px;
	color: #f8f820;
}
</style>

<script>
	var i = 0;

	$(document).ready(function() {
		$("#bookmark").on('click', function() {
			console.log(1);
			if (i == 0) {
				console.log("on");
				$(this).removeClass('.bi-star');
				$(this).addClass('.bi-star-fill');
				i++;
			} else if (i == 1) {
				console.log("off");
				$(this).removeClass('.bi-star-fill');
				$(this).addClass('.bi-star');
				i--;
			}

		});
	});
</script>
</body>

</head>

<body>
	<div>
		<div>
			<h1>MYMALL</h1>
			<a href="login"><button>로그인</button></a>
		</div>
		<hr>
		<div>
			<form>
				<div>
					<input type="text" name="search" value="${pager.search}"
						placeholder="쇼핑몰 이름을 입력하세요.">
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
							<ul>
								<li>${item.name }</li>
								<li>${item.content }</li>
								<li><a href="${item.url }" target="_blank">홈페이지로 이동 </a></li>
								<li><i id="bookmark" class="bi bi-star"></i></li>
							</ul>
						</div>
					</li>
				</c:forEach>

			</ul>
		</div>
	</div>
</body>
</html>