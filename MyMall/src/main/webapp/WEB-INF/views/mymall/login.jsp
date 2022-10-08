<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		</div>
		<hr>
		<div>
			<div><h3>login</h3></div>
			<form method="post">
				<div>
					<input type="text" name="id" placeholder="아이디를 입력하세요. ">
					
				</div>
				<div>
					<input type="password" name="pwd" placeholder="비밀번호를 입력하세요.">
				</div>
				<div>
					<button>로그인 </button>
				</div>
			</form>
			<div>
				<a href="signup">회원 가입 </a><br>
				<a href="find">아이디/비밀번호 찾기 </a>
			</div>
		</div>
	</div>
</body>
</html>