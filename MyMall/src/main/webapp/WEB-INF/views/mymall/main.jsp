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
<link rel="stylesheet"  href="/resources/css/button.css">
<link rel="stylesheet"  href="/resources/css/font.css">
<link rel="stylesheet"  href="/resources/css/font.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
html,body,.all {
  
    
}

.all{
	position: relative;
	
}
.all> div{
	
	width: 100vw;
	
}
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



.card button {
	border: 0;
	outline: 0;
	all: unset;
	position: absolute;
	bottom: 5px;
    right:10px;
}

.container {
	border: 1px solid #000;
}

h1 {
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



.card-img-top {
	width: 250px;
	height: 100px;
	object-fit: contain;
}
.card{
	width: 400px;
	position: relative;
}
.mall{
	height: auto;
}
.mall> li{
	display: inline-block;
	
}


.main{
	margin-left: auto;
	margin-right: auto;
	margin-top:15px;
	padding: 0;
	width: 1300px;
	height: auto;
}


.header_scroll{
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  
  height: 75px;
  padding: 1rem;
  color:black;
  font-weight: bold;
 
  background:rgba(225,225,225,0.5); 
}



.footer a{
	position: fixed;
	right: 0;
	bottom: 0;
	
	
}
.footer a img{
	width: 50px;
	height: 50px;
	transition: 1s;
	margin-bottom: 10px;
	margin-right: 10px;
   
}
.footer a img:hover{
	animation: ease-out;
      transition: 1s;
      transform: rotate(360deg);
}
.search{
	width: 25px;
	height: 25px;
	cursor: pointer;
}

.close{
	display:none;
}
.preserve{
	magin-top:75px;
}

.header{
	width:100vw;
	height: 75px;
	border-bottom: 1px solid #e4e4e4;;
	padding: 1rem;
}
.search_box{
	height:100vh;
	border:2px solid black;
	top:0px;
 	bottom:0px;
 	right:0px;
 	left:0px;
	background: white;
	opacity: 0.98;
 	z-index: 3000;
 	
 	scrollbar-width: none; 
 	position:fixed;
}
.bi-x-lg{
	 font-size: 40px;
	 margin-right: 10px;
	 cursor: pointer;
	 
}

.search_box> div:nth-child(1) {
	text-align: right;
}
.fix{
	overflow: hidden;
}
.search_btn{
	
	border:0;
	outline:0;
	all: unset;
	
}
.search_btn img{
	width: 50px;
	height: 50px;
	padding:1px 2px;
	margin-bottom: 10px;
	cursor: pointer;
}
.search_box> div:nth-child(2){
	width: 900px;
	margin: auto;
	text-align: center;
	border-bottom: 5px solid black;
}
.search_box> div:nth-child(2) input{
		width: 800px;
		height: 50px;
		border:none;
		font-size: 36px;
    	font-weight: 600;
    	outline: none;
}
</style>
<script>
	$(document).ready(function() {
		//var i = 0;
		$(".card  button").on('click', function(e) {
			const button=$(e.target);
			//console.log(button.closest("div").data("id"));
			const div=button.closest("div");
			const id=div.data("id");
			console.log(id);
			
			const class_=button.closest("span").attr("class");
			
			console.log(class_);
			if(class_=="bi-star"){
				console.log("button[id="+id+"] span");
				
				
				$.ajax("/mymall/bookmark?id=" + id,{
					method:'GET',
					success:result =>{
						console.log("result:",result);
						$("button[id="+id+"] span").removeClass("bi-star");
						$("button[id="+id+"] span").addClass("bi-star-fill");
					}
					
				});
				
				
				
			}
			else if(class_=="bi-star-fill"){
				
				$.ajax("/mymall/bookmark?id=" + id,{
					method:'DELETE',
					success:result =>{
						console.log("result:",result);
						$("button[id="+id+"] span").removeClass("bi-star-fill");
						$("button[id="+id+"] span").addClass("bi-star");
					}
					
				});
		
			}

		});
		$(".search").on('click',function(){
			console.log("on");
			$(".search_box").removeClass("close");
			//window.scrollTo(0,0);
			$("body").addClass("fix");
		});
		
		$(".bi-x-lg").on('click',function(){
			console.log("off");
			$(".search_box").addClass("close");
			
			$("body").removeClass("fix");
		});
		
		$(window).on("scroll",function(){
			if($(window).scrollTop()>1){
				$(".header_scroll").removeClass("close");
				$(".header").addClass("close");
				$("body").addClass("preserve");
			}else{
				$(".header_scroll").addClass("close");
				$(".header").removeClass("close");
				$("body").removeClass("preserve");
			}
		});
	});
</script>
</body>

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
		<div>
			
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
		<div class="main">
			<ul class="mall" >
				<c:if test="${list.size()<1 }">
					<li>
						<div>
							<p>쇼핑몰이 없습니다.</p>
						</div>
					</li>
				</c:if>
				<c:forEach var="item" items="${list}">
					<li>
						<div data-id="${item.id} " class="card text-center mb-3">
							<a href="${item.url }" target="_blank"> <c:if
									test="${ item.imageName !=null}">
									<img src="/upload/${item.imageName}" class="card-img-top"
										alt="...">
								</c:if> <c:if test="${ item.imageName ==null}">
									<img src="/resources/image/noImage.png" class="card-img-top"
										alt="...">
								</c:if>

							</a>
							<button type="button" id="${item.id}">
								<span class="bi-star${item.userId !=null ? '-fill':'' }"></span>
							</button>
							<div class="card-body">
								<h5 class="card-title">${item.name }</h5>
								<p class="card-text">${item.content }</p>
								<a href="product/${item.id }" class="btn btn-primary">베스트
									상품보기</a>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div class="close header_scroll">
			
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
		<div class="footer">
			<a href="/"><img alt="" src="/resources/image/logo.png"></a>
		</div>
		
		</div>
		
	</div>
	
	
</body>
</html>