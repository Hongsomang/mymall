<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  href="/resources/css/font.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link rel="stylesheet"  href="/resources/css/button.css">
<link rel="stylesheet"  href="/resources/css/font.css">
<link rel="stylesheet"  href="/resources/css/search.css">
<script src="/resources/js/search.js"></script>
<style type="text/css">
* {
	box-sizing: border-box;
}
.all{
	width: 100%;
}
body{

	width: 100%;
}
.header{
	width:100%;
	height: 75px;
	border-bottom: 1px solid #e4e4e4;
	padding: 1rem;
	
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
h1 {
	width: 200px;
	float: left;
	text-align: center;
	position: relative;
  	top: 50%;
  	transform: translateY(-50%);
}
h1>a{
	text-decoration-line: none;
	color: black;
}
h1>a:hover{
	color: black;
}
.product_box{
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
.main{
	width: 100%;
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
.search_div{
	width: 800px;
	margin: 0 auto;
	height:200px;
	text-align: center;
	display: flex;
	align-items:  center;
	
}
.search_div form div{
	border-bottom: 5px solid black;
}
.search_div form div input{
	width: 700px;
	height: 50px;
	border:none;
	font-size: 36px;
    font-weight: 600;
    outline: none;
}
.search_btn{
	
	border:0;
	outline:0;
	all: unset;
	
}
.search_btn img{
	width: 40px;
	height: 40px;
	padding:1px 2px;
	margin-bottom: 10px;
}
.type_box{
	height: 30px;
	text-align: center;
}
.type_box ul li{
	display: inline-block;
	padding-left:10px;
	padding-right:10px;
	font-size: 24px;
}
.type_box ul li a{
	text-decoration: none;
	color: black;
}
.bold{
	font-weight: 600;
}
.thin{
	font-weight: lighter;
}
.close{
	display:none;
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
.shoppingmall_box{
	margin-left: auto;
	margin-right: auto;
	margin-top:15px;
	padding: 0;
	width: 1300px;
	height: auto;
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
.card button {
	border: 0;
	outline: 0;
	all: unset;
	position: absolute;
	bottom: 5px;
    right:10px;
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
</style>
<script type="text/javascript">
	$(document).ready(function(){
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
							alert("????????? ????????? ?????????????????????.");
						}
						
					},
					error: result =>{
						alert("????????? ????????? ????????? ????????? ???????????????.");
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
							alert("????????? ????????? ?????? ???????????????.");
						}
						
					},
					error: result =>{
						alert("????????? ????????? ????????? ????????? ???????????????.");
					}
					
				});
				
			}
			
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
			<h1><a href="main">MYMALL</a></h1>
			<ul id="menu">
				<li><a href="allProduct"><button>?????? ??????</button></a></li>
				<li><a href="likesProduct"><button>????????? ??????</button></a></li>
				<c:if test="${sessionScope.user==null}">
					<li><a href="login"><button>?????????</button></a></li>
				</c:if>
				<c:if test="${sessionScope.user !=null }">
					<li><a href="mypage"><button>???????????????</button></a></li>
				</c:if>
				<li><img src="/resources/image/search_sm.png" class="search"></img></li>
			</ul>
		</div>
		<div class="main">
			
			<div class="search_div">
				<form  method="get">
					<div>
						<input type="text" name="search" placeholder="Search" value="${pager.search }">
						<button class="search_btn">
							<img src="/resources/image/search_sm.png"></img>
						</button>
					</div>
				</form>
			</div>
			
			<div class="type_box">
				<ul>
					
					<li><a class="product ${pager.type eq null ? 'bold':''  } ${pager.type eq 'product' ? 'bold':'thin'  }" href="?search=${pager.search}&type=product">?????? (${p_item.total})
					</a></li>
					<li><a class="shoppingmall ${pager.type eq 'shoppingmall' ? 'bold':'thin'  }  " href="?search=${pager.search}&type=shoppingmall">????????? (${s_item.total}) </a></li>
				</ul>
			</div>
			
			<div class="content_box">
				<div class="product_box   ${pager.type eq 'shoppingmall' ? 'close':''  }">
					<div>
						<c:if test="${p_list.size()<1}">
							<p >????????? ????????????.</p>
						</c:if>
						<c:forEach var="item" items="${p_list }">
							<div class="item">
								<div class="imagebox">
									<a href="${item.url }" target="_blank"> <img
										alt="${item.name }" src="${item.img}">
									</a>
								</div>
								<div class="item_content">
									<p class="name">${item.name }</p>
									<p>${item.price }</p>
									<button type="button" class="${item.id}">
										<span class="bi-heart${item.userId !=null ? '-fill' : ''}"></span>
									</button>
								</div>

							</div>
						</c:forEach>
					</div>
					<div id="page">
						<ul class="pagination pagination-sm justify-content-center">
							<li class="page-item"><a class="page-link" href="?search=${pager.search}&page=1">??????</a></li>
							<li class="page-item"><a class="page-link"
								href="?search=${pager.search}&page=${pager.prev }">??????</a></li>
							<c:forEach var="page" items="${ pager.list}">
								<li class="page-item"><a
									class="page-link ${page eq pager.page? 'active':''  }"
									href="?search=${pager.search}&page=${page }">${page}</a></li>
								<!--eq :????????? /pager.page: ??????????????? -->
							</c:forEach>
							<li class="page-item"><a class="page-link"
								href="?search=${pager.search}&page=${pager.next }">??????</a></li>
							<li class="page-item"><a class="page-link"
								href="?search=${pager.search}&page=${pager.last }">?????????</a></li>
						</ul>
					</div>
				</div>
				<div class="shoppingmall_box">
				
					<ul class="mall" >
				<c:if test="${s_list.size()<1 }">
					<li>
						<div>
							<p>???????????? ????????????.</p>
						</div>
					</li>
				</c:if>
				<c:forEach var="mall_item" items="${s_list}">
					<li>
						<div data-id="${mall_item.id} " class="card text-center mb-3">
							<a href="${mall_item.url }" target="_blank"> <c:if
									test="${mall_item.imageName !=null}">
									<img src="/upload/${mall_item.imageName}" class="card-img-top"
										alt="...">
								</c:if> <c:if test="${ mall_item.imageName ==null}">
									<img src="/resources/image/noImage.png" class="card-img-top"
										alt="...">
								</c:if>

							</a>
							<button type="button" id="${mall_item.id}">
								<span class="bi-star${mall_item.userId !=null ? '-fill':'' }"></span>
							</button>
							<div class="card-body">
								<h5 class="card-title">${mall_item.name }</h5>
								<p class="card-text">${mall_item.content }</p>
								<a href="product/${mall_item.id }" class="btn btn-primary">?????????
									????????????</a>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
				</div>
			
			
			</div>

		</div>
		<div class="header_scroll close">
			<h1><a href="main">MYMALL</a></h1>
			<ul id="menu">
				<li><a href="allProduct"><button>?????? ??????</button></a></li>
				<li><a href="likesProduct"><button>????????? ??????</button></a></li>
				<c:if test="${sessionScope.user==null}">
					<li><a href="login"><button>?????????</button></a></li>
				</c:if>
				<c:if test="${sessionScope.user !=null }">
					<li><a href="mypage"><button>???????????????</button></a></li>
				</c:if>
				<li><img src="/resources/image/search_sm.png" class="search"></img></li>
			</ul>
		</div>
	</div>
</body>
</html>