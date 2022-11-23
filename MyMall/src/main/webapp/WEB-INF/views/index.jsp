<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Allura&display=swap" rel="stylesheet">
<script type="text/javascript">
	var title_bool=false;
	var index=0;
	$(document).ready(function(){
		var titleText=$(".title_none").text();
		titleText=titleText.split("");
		
		if(title_bool==false){
			title_bool=true;
			var replay=setInterval(typing,200);
		}
		function typing(){
			if(index<titleText.length){
				$(".title").append(titleText[index]);
				index++;
			}else{
				clearInterval(replay);
				$('.title').fadeOut();
				setTimeout(function () {
					$('.content').fadeIn(2000);
					}, 500);
				
			}
		}
	});
</script>

<style type="text/css">
	html,body {
  margin: 0;
  padding: 0;
  overflow: hidden;
  height: 100%;
 	background: #405166;  /* fallback for old browsers */
	background: -webkit-linear-gradient(to bottom, #405166 0%,#656f6f 100%) no-repeat; /* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to bottom, #405166 0%,#656f6f 100%) no-repeat; /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */	
  	font-family: 'Allura', cursive;
}
 .titleBox{
 	height: 400px;
 	
 }
 .titleBox h1{
 	margin-top:100px;
 	text-align: center;
 	font-size: 100px;
 }
 
  .title_none{
  	display:none;
  }
	.title{
		text-align: center;
		font-size: 400px;
	}
  div button{
 	cursor: pointer;
  	width:250px;
  	height:70px;
  	border-radius: 10px;
  	border:2px solid  #405166;
  	background-color: transparent;
  	margin-left: 40px;
  	margin-right: 40px;
  	font-size: 20px;
  	color: white;
 	transition: background 300ms ease-in-out;
 	font-family: 'Allura', cursive;
 	font-weight: 600;
  }
   div button:hover{
  	
   box-shadow: 0 0 40px 40px  #405166 inset;
    
  }
   
  
  
  .buttonBox{
  	text-align: center;
  }
  .content{
  	display: none;
 }
</style>

</head>
<body>
	<div class="content">
		<div class="titleBox">
			<h1>mymall</h1>
		</div>
		<div class="buttonBox">
			<a href="mymall/main"><button>MainPage  </button></a>
			<a href="admin/login"><button>AdminPage </button></a>
		</div>
	</div>
	<h1 class="title_none">mymall</h1>
	<h1 class="title"></h1>
</body>
</html>