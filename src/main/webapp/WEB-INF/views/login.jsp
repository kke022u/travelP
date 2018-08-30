<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Login</title>
	<meta charset="UTF-8">
</head>
<body>
<h1>
	로그인
</h1>
<form action="userSelect" method="post">
	<input type="text" name="userId" placeholder="아이디 입력" maxlength="100" required="required">
	<input type="password" name="userPassword" placeholder="비번 입력" maxlength="10" required="required">
	<input type="submit" value="가입">
</form>
</body>
</html>
