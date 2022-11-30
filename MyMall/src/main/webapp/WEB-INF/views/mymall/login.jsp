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
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link rel="stylesheet"  href="/resources/css/button.css">
<link rel="stylesheet"  href="/resources/css/font.css">
<style type="text/css">
body{
	
}
.content {
	width: 500px;
	height:650px;
	margin-left: auto;
	margin-right: auto;
	padding-top: 150px;
	text-align: center;
	
}

.content input {
	width: 384px;
	height: 48px;
	margin-bottom: 10px;
	padding-left:10px;
	font-size: 15px;
	
}

.content h1 {
	font-size: 44px;
}
.content .inner{
	width: 400px;
	border-top: 5px solid black;
	padding-top: 30px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	
}
.inner form div button{
	width: 400px;
	height: 56px;
	margin-top: 20px;
	margin-bottom:10px;
	background: black;
	color: white;
	font-size: 16px;
	font-weight: bold;
}
.header{
 	width:100%;
	height: 75px;
	border-bottom: 1px solid #e4e4e4;;
	padding: 1rem;
}
.header> h1 {
	width: 200px;
	float: left;
	text-align: center;
	position: relative;
  	top: 50%;
  	transform: translateY(-50%);
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
<script type="text/javascript">
	$(document).ready(function(){
		$("#login").on('click',function(){
			const form=document.login_form;
			if(form.id.value==""){
				alert("아이디를 입력하세요.");
				form.id.focus();
				return;
			}
			if(form.pwd.value==""){
				alert("비밀번호를 입력하세요.");
				form.pwd.focus();
				return;
			}
		});
	});
</script>
</head>
<body>
	<div>
		<div class="header">
			
			<h1>MYMALL</h1>
			<ul id="menu">
				<li><a href="allProduct"><button >전체 상품</button></a></li>
				<li><a href="likesProduct"><button >좋아요 상품 </button></a></li>
				<c:if test="${sessionScope.user==null}">
					<li><a href="login"><button>로그인</button></a></li>
				</c:if>
				<c:if test="${sessionScope.user !=null }">
					<li><a href="mypage"><button>마이페이지</button></a></li>
				</c:if>
				<li><img src="/resources/image/search_sm.png" class="search"></img></li>
			</ul>
		</div>
		<div class="content">
			<div>
				<h1>로그인</h1>
			</div>
			<div class="inner">
				<form name="login_form" method="post">
					<div>
						<input type="text" name="id" placeholder="아이디를 입력하세요. ">

					</div>
					<div>
						<input type="password" name="pwd" placeholder="비밀번호를 입력하세요.">
					</div>
					<div>
						<button id="login">로그인</button>
					</div>
				</form>
			</div>
			<div>
				<a href="signup">회원 가입 </a><br> <a href="find">아이디/비밀번호 찾기</a>
			</div>
		</div>
	</div>
</body>
</html>