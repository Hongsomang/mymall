<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">


function signup(){
	var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //이메일 정규식 
	var email_id =$("#email_id").val();
	var email_domain =$("#email_domain").val();
	var mail ="";
	
	const form = document.signup_form;
	
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
		alter("비밀번호가 일치하지 않습니다.");
		form.pwd.focus();
		return;
	}
	if(form.name.value==""){
		alert("이름를 입력하세요.");
		form.name.focus();
		return;
	}
	if(email_id==""){
		alter("이메일을 입력해주세요.");
		$("#email_id").focus();
		return;
	}
	if(email_domain==""){
		alter("이메일 도메인을 입력하세요.");
		$("email.domain").focus();
		return;
	}
	mail=email_id+"@"+email_domain;
	$("#email").val(mail);
	
	if(!email_rule.test(mail)){
		alter("이메일을 형식에 맞게 입력해주세요.")
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
</head>
<body>
	<div>
		<div>
			<h1>MYMALL</h1>
		</div>
		<hr>
		<div>
			<form name="signup_form" method="post">
				<div>
					<label>아이디 </label>
					<input type="text" name="id" />
					<button>중복 확인</button>
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
				<div>
					<button  type="button" onclick="signup()">회원가입 </button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>