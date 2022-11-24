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
	margin-top: 75px;
	min-width: 992px;
	
	
}

h1{
	width:200px;
	float:left;
	text-align:center;
	
}
#menu >li{
	display: inline-block;
	
}
#menu{
	text-align:right ;
	padding-top:8px;	
	padding-right:10px;

}


.products {
	margin-left: auto;
	margin-right: auto;
	padding: 0;
	width: 1300px;
	text-align: center;
	margin-top: 20px;
	
}

.item {
	text-decoration: none;
	height: 500px;
	color: black;
	float: left;
	font-size: 15px;
	border: 1px solid #BDBDBD;
	margin-right: 10px;
	margin-left:10px;
	margin-bottom: 15px;
}

.imagebox img {
	width: 300px;
	height: 370px;
	margin-bottom: 15px;
	
}

div .name {
	width: 225px;
}

h1>a {
	text-decoration-line: none;
	color:gray;
}
h1>a:hover{
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
	width:300px;
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
.banner {
	width:100%;
	height: 600px;
	position: relative;
	clear: both;	

}
.banner >.inner{
	width:100%;
	 position: absolute;
	 top:30%;
	
}
.banner >.inner div{
	clear:both;
	text-align: center;
	width:100%;
	height: 200px;

}
.banner >.inner div h1{
	text-align: center;
	color:white;
	width:100%;
	font-size: 90px;
}
.banner >.inner div >div{
	font-size: 25px;
}
.banner img{
	width: 100%;
	height: 100%;
	position: absolute;
	object-fit:cover;
}
.banner .background{
	width: 100%;
	height: 100%;
	background: gray;
	position: absolute;
	opacity:0.5;
}
.header{
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  
  height: 75px;
  padding: 1rem;
  color: gray;
  font-weight: bold;
 
  background:rgba(225,225,225,0.5); 
}
#menu li a button{
	background: none;
	width: 100px;
	margin-left:10px; 
	border:2px solid gray;
	color:gray;
	font-weight: bold;
}
#menu li a button:hover{
	color: white;
    background: black;
    border:2px solid black;
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
			$.ajax("likes?id="+id,{
				method:"GET",
				success:result =>{
					console.log("like",result);
					if(result=="ok"){
						
						$("button[class="+id+"] span").removeClass("bi-heart");
						$("button[class="+id+"] span").addClass("bi-heart-fill");
					}
					else{
						alert("좋아요 등록에 실패하셨습니다.");
					}
					
				},
				error: result =>{
					alert("좋아요 등록은 로그인 이후에 가능합니다.");
				}
			});
			
			
		}else if(class_=="bi-heart-fill"){
			$.ajax("likes?id="+id,{
				method:"DELETE",
				success:result =>{
					console.log("like",result);
					if(result=="ok"){
						$("button[class="+id+"] span").removeClass("bi-heart-fill");
						$("button[class="+id+"] span").addClass("bi-heart");
					}
					else{
						alert("좋아요 삭제에 실패 하셨습니다.");
					}
					
				},
				error: result =>{
					alert("좋아요 삭제는 로그인 이후에 가능합니다.");
				}
				
			});
			
		}
		
	});
});
</script>
</head>
<body>
	<div>
		<div class="banner">
			<img alt="" src="/resources/image/background_product.jpeg">
			<div class="background"></div>
			<div class="inner">
				<div>
					<h1>Best Products</h1> 
					<div>모든 쇼핑몰의 베스트 아이템을 확인해 보세요!</div>
				</div>
			</div>
		</div>
		<div class="header">
			<h1>
				<a href="main">MYMALL</a>
			</h1>
			<ul id="menu">
				<li><a href="allProduct"><button >전체 상품</button></a></li>
				<li><a href="likesProduct"><button >좋아요 상품 </button></a></li>
				<c:if test="${sessionScope.user==null}">
					<li><a href="login"><button>로그인</button></a></li>
				</c:if>
				<c:if test="${sessionScope.user !=null }">
					<li><a href="mypage"><button>마이페이지 </button></a></li>
				</c:if>
			</ul>
		</div>
		
		<div class="products">
			<div >
				<c:if test="${list.size()<1}">
					<p>상품이 없습니다.</p>
				</c:if>
				<c:forEach var="item" items="${list }">
					<div class="item">
						<div class="imagebox">
							<a href="${item.url }" target="_blank"> 
							<img alt="${item.name }" src="${item.img}">
							</a>
						</div>
						<div class="item_content">
							<p class="name">${item.name }</p>
							<p >${item.price }</p>
							<button  type="button" class="${item.id}"><span class="bi-heart${item.userId !=null ? '-fill' : ''}"></span></button>
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