<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style type="text/css">
*{
	margin:0px;
	padding: 0px;
	font-family: 'Noto Sans', 'Noto Sans KR',sans-serif;
	
}
 .header h1{
	margin-left: 20px;
	font-size: 35px;
	
}

hr{
	margin: 16px 0px;
	color: inherit;
	opacity: .25;
}
.header{
	height: 70px;
	display: flex;
	align-items: center;
	
	
}
.content{
	width: 500px;
	height:650px;
	margin-left: auto;
	margin-right: auto;
	padding-top: 150px;
	text-align: center;
}

.content .inner form div input {
	width: 384px;
	height: 48px;
	margin-bottom: 10px;
	padding-left:10px;
	font-size: 15px;
	float: right;
	
}
.content .inner form div label{
	height: 50px;
	float: left;
	display: flex;
	align-items: center;
}

.content h1 {
	font-size: 44px;
	margin-bottom: 20px;
}
.content .inner{
	 border-top: 5px solid black;
	padding-top: 30px;
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}
.inner form div button{
	width: 220px;
	height: 56px;
	margin-top: 20px;
	margin-bottom:10px;
	background: black;
	color: white;
	font-size: 16px;
	font-weight: bold;
	margin:20px 10px 15px 15px;
}
</style>
</head>
<body>
	<div class="header">
		<h1>관리자 페이지 </h1>
			
	</div>
	<hr>
	<div class="content">
		<div>
			<h1>로그인 </h1>
		</div>
		<div class="inner">
			<form action="" method="post">
				<div>
					<label>아이디:</label>
					<input type="text" name="id" placeholder="아이디를 입력해 주세요.">
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