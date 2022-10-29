<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.bi-star {
	font-size: 30px;
	line-height: 30px;
	color: #D5D5D5;
	
}

.bi-star-fill {
	font-size: 30px;
	line-height: 30px;
	color: #f8f820;
}

ul {
	list-style: none;
}

.box>li {
	display: inline-block;
	
}
.box button{
	border:0;
	outline:0;
	all: unset;
}
.container{
	border: 1px solid #000;

	
}
h1{
	width:200px;
	float:left;
	text-align:center;
	padding-top :10px;
}
#menu >li{
	display: inline-block;
	
}
#menu{
	text-align:right ;
	padding-top:15px;	
	padding-right:10px;

}

hr{
	clear:both;
	
}

</style>

<script>
	$(document).ready(function() {
		//var i = 0;
		$(".container li  button").on('click', function(e) {
			const button=$(e.target);
			//console.log(button.closest("div").data("id"));
			const div=button.closest("div");
			const shoppingmall_id=div.data("id");
			console.log(shoppingmall_id);
			
			const name=button.closest("span").attr("class");
			
			console.log(name);
			if(name=="bi-star"){
				console.log("button[id="+shoppingmall_id+"] span");
				
				
				const item={
					shoppingmallId:	shoppingmall_id
				};
				
				$.ajax("main/bookmark",{
					method:"POST",
					contentType:"application/json",
					data:JSON.stringify(item),
					success:result =>{
						console.log(result);
						$("button[id="+shoppingmall_id+"] span").removeClass("bi-star");
						$("button[id="+shoppingmall_id+"] span").addClass("bi-star-fill");
					}
					
				});
				
			}
			else if(name=="bi-star-fill"){
				$("button[id="+shoppingmall_id+"] span").removeClass("bi-star-fill");
				$("button[id="+shoppingmall_id+"] span").addClass("bi-star");
			}

		});
	});
</script>
</body>

</head>

<body>
	<div>
		<div id="header">
			<h1>MYMALL</h1>
			<ul id="menu">
				<li><a href="all"><button>전체상품 </button></a></li>
				<c:if test="${sessionScope.user==null}">
					<li><a href="login"><button>로그인</button></a></li>
				</c:if>
				<c:if test="${sessionScope.user !=null }">
					<li><a href="mypage"><button>마이페이지 </button></a></li>
				</c:if>
			</ul>
		</div>
		<hr>
		<div id="content">
			<form>
				<div>
					<input type="text" name="search" value="${pager.search}"
						placeholder="쇼핑몰 이름을 입력하세요.">
					<button>검색</button>
				</div>
			</form>
		</div>
		<div>
			<ul>
				<c:if test="${list.size()<1 }">
					<li>
						<div>
							<p>쇼핑몰이 없습니다.</p>
						</div>
					</li>
				</c:if>
				<c:forEach var="item" items="${list}">
					<li >
						<div data-id="${item.id} " class="container" >
							 
							<ul class="box">
								<li>${item.name }</li>
								<li>${item.content }</li>
								<li><a href="${item.url }" target="_blank">홈페이지로 이동 </a></li>
								<li><a class="prouctUrl" href="product/${item.id }"> 제품보기 </a></li>
								<li><button id="${item.id}"  ><span  class="bi-star"></span></button></li>
							</ul>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>