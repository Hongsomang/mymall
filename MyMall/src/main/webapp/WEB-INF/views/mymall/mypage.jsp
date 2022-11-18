<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
body{
	margin-top: 75px;
}
.header{
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  height: 75px;
  padding: 1rem;
  color: gray;
  font-weight: bold;
 
  background:rgba(225,225,225,0.5); 
}
.header> h1{
	width: 500px;
	display: inline-block;
}
.header> h1>a {
	text-decoration-line: none;
	color: gray;
	
}

.header>h1>a:hover{
	color: black;
}

#menu>li {
	display: inline-block;
}

#menu {
	float: right;
	text-align:right;
	width:400px;
	padding-right: 10px;
	display: inline-block;
}
#menu li a button{
	background: none;
	width: 100px;
	margin-left:10px; 
	border:2px solid gray;
	color:gray;
	font-weight: bold;
}
#menu li a button:hover{
	color: white;
    background: black;
    border:2px solid black;
}
</style>
</head>
<body>
	<div class="header">
			<h1>
				<a href="main">MYMALL</a>
			</h1>
			<ul id="menu">
				<li><a href="allProduct"><button >전체 상품</button></a></li>
				<li><a href="likesProduct"><button >좋아요 상품 </button></a></li>
				<c:if test="${sessionScope.user==null}">
					<li><a href="login"><button>로그인</button></a></li>
				</c:if>
				<c:if test="${sessionScope.user !=null }">
					<li><a href="mypage"><button>마이페이지</button></a></li>
				</c:if>
			</ul>
		</div>
	<div>
		<c:if test="${sessionScope.user != null}">	 
			<p> ${sessionScope.user.name} 님의 마이페이지입니다.</p>
		</c:if>
		<c:if test="${sessionScope.user == null}">
			<p> 세션 없음 </p>
		</c:if>
		<a href="logout"> 로그아웃 </a>
	</div>
</body>
</html>