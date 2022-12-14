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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link rel="stylesheet"  href="/resources/css/font.css">
<link rel="stylesheet"  href="/resources/css/search.css">
<script src="/resources/js/search.js"></script>
<style type="text/css">
body{
	min-width: 992px;
}
.header{
	width:100%;
	height: 75px;
	border-bottom: 1px solid #e4e4e4;;
	padding: 1rem;
}
.header> h1{
	width: 500px;
	display: inline-block;
	position: relative;
  	top: 50%;
  	transform: translateY(-50%);
}
.header> h1>a {
	text-decoration-line: none;
	color: black;
	
}

.header>h1>a:hover{
	color: black;
}

#menu>li {
	display: inline-block;
}

#menu {
	float: right;
	margin:0px 20px 0px 0px;
	position: relative;
  	top: 50%;
  	transform: translateY(-50%);
  	
	}
#menu li a button{
	background: none;
	width: 100px;
	margin-left:10px; 
	border:0;
	outline:0;
	color:black;
	font-weight: bold;
}
#menu li a button:hover{

  
    border-bottom:4px solid black;
}
.search{
	width: 25px;
	height: 25px;
	cursor: pointer;
}

.close{
	display:none;
}
</style>
</head>
<body>
	<div class="all">
	<div class="search_box close">
			<div>
				<i class="bi-x-lg"></i>
			</div>
			<div>
				<form action="search" method="get">
				<div>
					<input type="text" name="search" placeholder="Search">
					<button  class="search_btn"><img src="/resources/image/search_sm.png"></img> </button>
				</div>
				</form>
			</div>
		</div>
	<div class="header">
			<h1>
				<a href="main">MYMALL</a>
			</h1>
			<ul id="menu">
				<li><a href="allProduct"><button >?????? ??????</button></a></li>
				<li><a href="likesProduct"><button >????????? ?????? </button></a></li>
				<c:if test="${sessionScope.user==null}">
					<li><a href="login"><button>?????????</button></a></li>
				</c:if>
				<c:if test="${sessionScope.user !=null }">
					<li><a href="mypage"><button>???????????????</button></a></li>
				</c:if>
				<li><img src="/resources/image/search_sm.png" class="search"></img></li>
			</ul>
		</div>
	<div>
		<c:if test="${sessionScope.user != null}">	 
			<p> ${sessionScope.user.name} ?????? ????????????????????????.</p>
		</c:if>
		<c:if test="${sessionScope.user == null}">
			<p> ?????? ?????? </p>
		</c:if>
		<a href="logout"> ???????????? </a>
	</div>
	</div>
</body>
</html>