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

<link rel="stylesheet"  href="/resources/css/font.css">
<link rel="stylesheet"  href="/resources/css/search.css">
<script src="/resources/js/search.js"></script>
<style type="text/css">
* {
	box-sizing: border-box;
}

body {
	
	min-width: 992px;
	
	
}

h1{
	width:200px;
	float:left;
	text-align:center;
	
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
	color:black;
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
.header_scroll{
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  
  height: 75px;
  padding: 1rem;
  color: black;
  font-weight: bold;
 
  background:rgba(225,225,225,0.5); 
}
.header{
	width:100%;
	height: 75px;
	border-bottom: 1px solid #e4e4e4;;
	padding: 1rem;
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
.header h1,.header_scroll h1{
	position: relative;
  	top: 50%;
  	transform: translateY(-50%);
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
			<h1>
				<a href="main">MYMALL</a>
			</h1>
			<ul id="menu">
				<li><a href="allProduct"><button >?????? ??????</button></a></li>
				<li><a href="likesProduct"><button >????????? ?????? </button></a></li>
				<c:if test="${sessionScope.user==null}">
					<li><a href="login"><button>?????????</button></a></li>
				</c:if>
				<c:if test="${sessionScope.user !=null }">
					<li><a href="mypage"><button>??????????????? </button></a></li>
				</c:if>
				<li><img src="/resources/image/search_sm.png" class="search"></img></li>
			</ul>
		</div>
		<div class="banner">
			<img alt="" src="/resources/image/background_product.jpeg">
			<div class="background"></div>
			<div class="inner">
				<div>
					<h1>Best Products</h1> 
					<div>?????? ???????????? ????????? ???????????? ????????? ?????????!</div>
				</div>
			</div>
		</div>
		<div class="header_scroll close">
			<h1>
				<a href="main">MYMALL</a>
			</h1>
			<ul id="menu">
				<li><a href="allProduct"><button >?????? ??????</button></a></li>
				<li><a href="likesProduct"><button >????????? ?????? </button></a></li>
				<c:if test="${sessionScope.user==null}">
					<li><a href="login"><button>?????????</button></a></li>
				</c:if>
				<c:if test="${sessionScope.user !=null }">
					<li><a href="mypage"><button>??????????????? </button></a></li>
				</c:if>
				<li><img src="/resources/image/search_sm.png" class="search"></img></li>
			</ul>
		</div>
		
		<div class="products">
			<div >
				<c:if test="${list.size()<1}">
					<p>????????? ????????????.</p>
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
				<li class="page-item"><a class="page-link" href="?page=1">??????</a></li>
				<li class="page-item" ><a class="page-link" href="?page=${pager.prev }">??????</a></li>
				<c:forEach var="page" items="${ pager.list}">
					<li class="page-item"> <a class="page-link ${page eq pager.page? 'active':''  }"  href="?page=${page }">${page}</a></li> <!--eq :????????? /pager.page: ??????????????? -->
				</c:forEach>
				<li class="page-item"><a class="page-link" href="?page=${pager.next }">??????</a></li>
				<li class="page-item" ><a class="page-link" href="?page=${pager.last }">?????????</a></li>
			</ul> 
			</div>
		</div>
	</div>

</body>
</html>