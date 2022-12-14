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
<link rel="stylesheet"  href="/resources/css/button.css">
<link rel="stylesheet"  href="/resources/css/font.css">
<link rel="stylesheet"  href="/resources/css/search.css">
<script src="/resources/js/search.js"></script>
<script type="text/javascript">
let isCheck;

function checkId(){
	if(document.signup_form.id.value == "") {
		alert("중복검사 전에 아이디를 입력 해 주세요");			
		return;
	}
	const form = document.signup_form;
	
	const xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function() {
		console.log(xhr.readyState);
		
		if(xhr.readyState == XMLHttpRequest.DONE) {
			if(xhr.status == 200) {
				const result = xhr.responseText;
				console.log("응답: " + result);
				
				if(result == "OK") {
					isCheck = form.id.value;
					alert("사용 가능한 아이디 입니다");
				} else
					alert(" 이미 사용중인 아이디 입니다");
			}
		}
	};
	
	xhr.open("GET", "checkId/" + form.id.value, true);
	
	xhr.send();
}

function signup(){
	var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //이메일 정규식 
	var email_id =$("#email_id").val();
	var email_domain =$("#email_domain").val();
	var mail ="";
	
	const form = document.signup_form;
	
	if(isCheck != form.id.value) {
		alert("아이디 중복 검사를 하셔야 합니다");
		return;
	}
	
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
	if(form.pwd_ck.value==""){
		alert("비밀번호 확인를 입력하세요.");
		form.pwd_ck.focus();
		return;
	}
	if(form.pwd.value != form.pwd_ck.value){
		alert("비밀번호가 일치하지 않습니다.");
		form.pwd.focus();
		return;
	}
	if(form.name.value==""){
		alert("이름를 입력하세요.");
		form.name.focus();
		return;
	}
	if(email_id==""){
		alert("이메일을 입력해주세요.");
		$("#email_id").focus();
		return;
	}
	if(email_domain==""){
		alert("이메일 도메인을 입력하세요.");
		$("email.domain").focus();
		return;
	}
	mail=email_id+"@"+email_domain;
	$("#email").val(mail);
	
	if(!email_rule.test(mail)){
		alert("이메일을 형식에 맞게 입력해주세요.");
		return;
	}
	
	console.log($("#email").val());
	console.log(mail);
	
	form.submit();
}


$(document).ready(function(){
	$("#select_email").change(function(){
		if($(this).val()=='1'){
			$("#email_domain").val("");
			$("#email_domain").attr("disabled",false); //활성화 
		}
		else{
			$("#email_domain").val($(this).val());
			$("#email_domain").attr("disabled",true); //비활성화 
			console.log("확인 "+$(this).val());
		}
		
	});
	 
});

</script>
<style type="text/css">
.content{
	width: 500px;
	height: 500px;
	margin-left: auto;
	margin-right: auto;
	font-size: 16px;
	margin-top: 150px;
	
}
.content h1{
	font-size: 44px;
	text-align: center;
	margin-bottom: 20px;
}
form{
	border-top: 5px solid black;
	padding-top: 30px;
}
form div{
	height:40px;
	margin-bottom: 10px;
	
}
form >div >label{
	height: 40px;
	
	
}
form div input{
	height: 36px;
	padding-left:10px;
	
}
form >div:nth-child(n+2):nth-child(-n+4) >input{
	
	width: 382px;
	float: right;
}
form div:nth-child(1) div{
	
	float: right;
}
form div:nth-child(1) div input{
	width: 298px;
	
	
}
form div:nth-child(1) div button{
	height: 36px;
	width: 80px;
	background: black;
	color: white;
	
}

form div:nth-child(5) div select{
	height: 36px;
	width: 96px;
	
}
form div:nth-child(5) div input{
	width: 130px;
}
form div:nth-child(5) div{
	float: right;
}
form div:nth-child(6){
	text-align: right;
	
}
form div:nth-child(6) button{
	width: 384px;
	height: 36px;
	background: black;
	color: white;
	font-weight: bold;
}
.header{
  	width:100%;
	height: 75px;
	border-bottom: 1px solid #e4e4e4;
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
		<div class="content" >
			<h1>회원 가입</h1>
			<form name="signup_form" method="post">
				<div>
					<label>아이디 </label>
					<div>
						<input type="text" name="id" />
						<button type="button" onclick="checkId()">중복 확인</button>
					</div>
				</div>
				<div>
					<label>비밀 번호</label>
					<input type="password" name="pwd">
				</div>
				<div>
					<label>비밀 번호 확인 </label>
					<input type="password" name="pwd_ck">
				</div>
				<div>
					<label>이름</label>
					<input type="text" name="name">
				</div>
				<div>
					<label>이메일 </label>
					<div>
						<input type="text" id="email_id" >
						@
						<input type="text" id="email_domain"/>
						<select id="select_email">
							<option value="1" selected>-직접입력-</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
						</select>
						<input type="hidden" id="email" name="email" >
					</div>
				</div>
				<div>
					<button  type="button" onclick="signup()">회원 가입 </button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>