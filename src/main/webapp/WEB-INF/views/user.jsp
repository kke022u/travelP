<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Login</title>
	<meta charset="UTF-8">
	<script type="text/javascript" src="webjars/jquery/3.3.1/dist/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			$("form").submit(function(e){
			});
		});
	</script>
</head>
<body>
<h1>
	회원가입
</h1>
<form action="userInsert" method="post">
	<input type="text" name="userId" placeholder="아이디 입력" maxlength="100" required="required">
	<input type="password" name="userPassword" placeholder="비번 입력" maxlength="10" required="required">
	<input type="text" name="userName" placeholder="이름 입력" maxlength="50" required="required">
	<input type="submit" value="가입">
</form>
</body>
</html>
