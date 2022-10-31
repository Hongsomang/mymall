<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<style type="text/css">
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	min-width: 992px;
	font-family: "Helvetica";
}

.products {
	margin-left: auto;
	margin-right: auto;
	padding: 0;
	width: 740px;
	text-align: center;
	
}

.item {
	text-decoration: none;
	height: 350px;
	color: black;
	float: left;
	font-size: 11px;
	border: 1px solid #BDBDBD;
	margin-right: 15px;
	margin-bottom: 15px;
}

.imagebox img {
	width: 225px;
	height: 225px;
	margin-bottom: 15px;
	
}

div .name {
	width: 225px;
}

h1>a {
	text-decoration-line: none;
	color: black;
}
#page{
	clear:both;
}
.item_content{
	height:110px;
	position:relative;
}
.item_content >.name{
	padding-left:5px;
	padding-right:5px;
}
.item_content button{
	
	border:0;
	outline:0;
	all: unset;
	position: absolute;
    bottom: 5px;
    right:10px;
   

}
.bi-heart {
	font-size: 20px;
	line-height: 20px;
	color: #D5D5D5;
	
}
.bi-heart-fill{
	font-size: 20px;
	line-height: 20px;
	color:#FF4848;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$(".item_content button").on('click',function(e){
		const button=$(e.target);
		const id=button.closest("button").attr("class");
		console.log(id);
		const class_=button.closest("span").attr("class");
		
		console.log(class_);
		if(class_=="bi-heart"){
			$("button[class="+id+"] span").removeClass("bi-heart");
			$("button[class="+id+"] span").addClass("bi-heart-fill");
		}else if(class_=="bi-heart-fill"){
			$("button[class="+id+"] span").removeClass("bi-heart-fill");
			$("button[class="+id+"] span").addClass("bi-heart");
		}
		
	});
});
</script>
</head>
<body>
	<div>
		<div>
			<h1>
				<a href="../main">MYMALL</a>
			</h1>
			<a href="login"><button>로그인</button></a>
		</div>
		<hr>
		<div class="products">
			<div >
				<c:if test="${list.size()<1}">
					<p>상품이 없습니다.</p>
				</c:if>
				<c:forEach var="item" items="${list }">
					<div class="item">
						<div class="imagebox">
							<a href="${item.url }" target="_blank"> <img
								alt="${item.name }" src="${item.img}">
							</a>
						</div>
						<div class="item_content">
							<p class="name">${item.name }</p>
							<p >${item.price }</p>
							<button  type="button" class="${item.id}"><span class="bi-heart"></span></button>
						</div>
						
					</div>
				</c:forEach>
			</div>
			<div id="page">
				<ul class="pagination pagination-sm justify-content-center">
				<li class="page-item"><a class="page-link" href="?page=1">처음</a></li>
				<li class="page-item" ><a class="page-link" href="?page=${pager.prev }">이전</a></li>
				<c:forEach var="page" items="${ pager.list}">
					<li class="page-item"> <a class="page-link ${page eq pager.page? 'active':''  }"  href="?page=${page }">${page}</a></li> <!--eq :같으면 /pager.page: 현재페이지 -->
				</c:forEach>
				<li class="page-item"><a class="page-link" href="?page=${pager.next }">다음</a></li>
				<li class="page-item" ><a class="page-link" href="?page=${pager.last }">마지막</a></li>
			</ul> 
			</div>
		</div>
	</div>

</body>
</html>