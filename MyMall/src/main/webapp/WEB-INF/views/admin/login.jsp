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
			<h3>login</h3>
		</div>
		<div>
			<form action="" method="post">
				<div>
					<label>아이디:</label>
					<input type="text" name="id">
				</div>
				<div>
					<label>비밀번호: </label>
					<input type="password" name="pwd">
				</div>
				<div>
					<a href="list"><button >로그인 </button></a>
					<a	href="/"><button type="button">취소 </button></a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>