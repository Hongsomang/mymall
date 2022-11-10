<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.content {
	width: 500px;
	height:650px;
	margin-left: auto;
	margin-right: auto;
	padding-top: 200px;
	text-align: center;
	
}

.content input {
	width: 392px;
	height: 48px;
	margin-bottom: 10px;
}

.content h1 {
	font-size: 44px;
}
.content .inner{
	width: 400px;
	border-top: 2px solid black;
	padding-top: 30px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}
</style>
</head>
<body>
	<div>
		<div>
			<h1>MYMALL</h1>
		</div>
		<hr>
		<div class="content">
			<div>
				<h1>로그인</h1>
			</div>
			<div class="inner">
				<form method="post">
					<div>
						<input type="text" name="id" placeholder="아이디를 입력하세요. ">

					</div>
					<div>
						<input type="password" name="pwd" placeholder="비밀번호를 입력하세요.">
					</div>
					<div>
						<button>로그인</button>
					</div>
				</form>
			</div>
			<div>
				<a href="signup">회원 가입 </a><br> <a href="find">아이디/비밀번호 찾기
				</a>
			</div>
		</div>
	</div>
</body>
</html>