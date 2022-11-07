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
			<h1>관리자페이지 </h1>
			
		</div>
		<hr>
		<div>
			<div>
				<form method="post" enctype="multipart/form-data">
					<div>
						<div>
							<label>쇼핑몰이름: </label>
							<input type="text" name="name" value="${item.name }">
						</div>
						<div>
							<label>한 줄 소개: </label>
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
						<div>
							<label>로고 이미지 </label>
							<input type="file" name="imageFile" placeholder="이미지를 업로드해세요." >
							
						</div>
						<div>
							<button >변경 </button>
							<a href="/admin/list"><button type="button">취소 </button></a>							
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>