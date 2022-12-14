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
.infoBox> div:nth-child(6) {
	text-align: center;
}
.infoBox> div:nth-child(6) button{
	width:200px;
	height: 40px;
	color:white;
	background: black;
	cursor: pointer;
}
.header{
	height: 70px;
	
}
.header h1{
	padding-top:17px;
	margin-left:20px;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#file").change(function(){
	  	var fileName = $("#file").val();
	  	var arr=fileName.split("\\");
	  	console.log("dddd",arr[arr.length-1]);
	  	$(".upload-name").val(arr[arr.length-1]);
	});
});

function add(){
	const form = document.update_form;
	if(form.name.value==null){
		alert("쇼핑몰 이름를 입력하세요.");
		form.name.focus();
		return;
	}
	if(form.content.value==null){
		alert("한 줄 소개를 입력하세요.");
		form.name.focus();
		return;
	}
	if(form.content.value.length>=30){
		alert("한 줄 소개를 30자 이내로 해주세요. ");
		form.name.focus();
		return;
	}
	if(form.url.value==null){
		alert("홈페이지 주소를 입력하세요.");
		form.url.focus();
		return;
	}
	if(form.bestCode.value==null){
		alert("bestCode 입력하세요.");
		form.url.focus();
		return;
	}	
	form.submit();
	
}
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
				<h1>쇼핑몰 정보 수정</h1>
			</div>
			<div >
				<form name="update_form" method="post" enctype="multipart/form-data">
					<div class="infoBox">
						<div>
							<label>쇼핑몰이름 </label>
							<input type="text" name="name" value="${item.name }">
						</div>
						<div>
							<label>한 줄 소개 </label>
							<input type="text" name="content" placeholder="20자 이내로 써주세요."  value="${ item.content}">
						</div>
						<div>
							<labeL>홈페이지 주소 </label>
							<input type="text" name="url" placeholder="쇼핑몰 홈페이지 주소를 입력해주세요." value="${item.url}">
						</div>
						<div>
							<label>best code</label>
							<input type="text" name="bestCode" placeholder="베스트 상품 홈페이지 주소 중 cate_no 다음에 나오는 숫자를 입력하세요 " value="${item.bestCode}">
						</div>
						<div >
							<label>로고 이미지</label>
							<div class="fileBox">
								<input class="upload-name" value="${item.imageName }" placeholder="첨부파일" readonly >
								<label for="file">이미지 업로드</label>
								<input type="file" name="imageFile"  id="file">
							</div>
						</div>
						<div>
							<button type="button" onclick="add()"  >변경 </button>
							<a href="/admin/list"><button type="button">취소 </button></a>							
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>