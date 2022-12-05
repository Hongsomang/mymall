<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"  href="/resources/css/button.css">
<link rel="stylesheet"  href="/resources/css/font.css">
<style type="text/css">
*{
	margin: 0;
	padding: 0;
}

.content{
	margin:auto;
	width: 800px;
	
}
.content div h1{
	text-align: center;
}
.infoBox{
	height: 800px;
	margin-top: 20px;
}
.infoBox div{
	height: 46px;
	margin-bottom: 10px;
}
.infoBox div label{
	font-size: 18px;
	height: 40px;
}
.infoBox> div> label:nth-last-child(){
	display: inline-block;
}

.infoBox> div> input{
	float: right;
	height: 40px;
	width: 600px;
	padding: 0 10px;
}
.fileBox {
	display: inline-block;
	float: right;
	vertical-align: middle;
}
.fileBox .upload-name {
   	display:inline-block;
    padding: 0 10px;
    vertical-align: middle;
    width: 486px;
    height: 40px;
}
.fileBox label[for="file"] {
    width:100px;
  	display:inline-block;
  	font-size:13px;
    color: #fff;
    background-color: black;
    vertical-align:middle;
    text-align:center;
    cursor: pointer;
    line-height: 40px;
    padding-left :5px;
    padding-right :5px;
    margin-left: 10px;
}
.fileBox input[type="file"]{
    
   	display: none;
}
.infoBox> div:nth-child(5) {
	text-align: center;
}
.infoBox> div:nth-child(5) button{
	width:200px;
	height: 40px;
	color:white;
	background: black;
	cursor: pointer;
}

.header h1{
	height: 70px;
	padding-top:17px;
	margin-left:20px;
    
 
}
.header 
</style>
<script type="text/javascript">

$(document).ready(function(){
	$(".add").on("click",function(){
		
		const form = document.add_form;
		console.log("dfdfd",form.name.value);
		if(form.name.value==""){
			console.log("dfdfd111");
			alert("상품 이름를 입력하세요.");
			form.name.focus();
			return;
		}
		if(form.img.value==""){
			alert("이미지 주소를 입력하세요.");
			form.img.focus();
			return;
		}
		
		if(form.url.value==""){
			alert("상품페이지 주소를 입력하세요.");
			form.url.focus();
			return;
		}
		if(form.price.value==""){
			alert("가격을 입력하세요.");
			form.url.focus();
			return;
		}
		form.submit();
	});
});
</script>
</head>
<body>
	<div>
		<div class="header">
			<h1>관리자 페이지 </h1>
			
		</div>
		<hr>
		<div class="content">
			<div>
				<h1>상품 추가 </h1>
			</div>
			<div >
				<form  name="add_form" method="post" >
					<div class="infoBox">
						<div>
							<label>상품이름 </label>
							<input type="text" name="name" placeholder="상품 이름을 입력해주세요." >
						</div>
						<div>
							<label>이미지</label>
							<input type="text" name="img" placeholder="이미지 주소를 넣어 주세요."  >
						</div>
						<div>
							<labeL>가격 </label>
							<input type="text" name="price" placeholder="가격을 입력해주세요.">
						</div>
						<div>
							<label>상품 페이지 </label>
							<input type="text" name="url" placeholder="상품페이지 주소를 입력해주세요 ">
						</div>
						
						<div>
							<button  type="button" class="add">추가 </button>
							<a href="list"><button type="button">취소 </button></a>							
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>