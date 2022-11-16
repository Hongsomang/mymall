<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
</head>
<body>
	<div>
		<h1>MYMALL <img class="move" alt="" src="/resources/image/logo.png"></h1>
	</div>
	<div>
		<a href="admin/login"><button>관리자 페이지  </button></a>
	</div>
	<div>
		<a href="mymall/main"><button>메인 페이지   </button></a>
	</div>
</body>
</html>