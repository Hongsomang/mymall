<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Allura&display=swap" rel="stylesheet">
<style type="text/css">
  .move{
      transition: 1s;
      width: 30px;
      height: 30px;
    }
    .move:hover{
      animation: ease-out;
      transition: 1s;
      transform: rotate(360deg);
    }
   body{
 	background: #B79891;  /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #94716B, #B79891);  /* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #94716B, #B79891); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */	
  	font-family: 'Allura', cursive;
  	
   }
  
</style>
</head>
<body>
	<div>
		<h1>mymall</h1>
		
	</div>
	<div>
		<a href="admin/login"><button>관리자 페이지  </button></a>
	</div>
	<div>
		<a href="mymall/main"><button>메인 페이지   </button></a>
	</div>
</body>
</html>