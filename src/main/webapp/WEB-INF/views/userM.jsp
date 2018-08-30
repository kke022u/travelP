<%@page import="java.util.function.Function"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
	<title>리스트</title>
	<meta charset="UTF-8">
	<script type="text/javascript" src="webjars/jquery/3.3.1/dist/jquery.min.js"></script>

	<script>
		$(document).ready(function(){
			$.ajax({
			 	type: "post",
			 	url : "userList"
			 }).done(function(data){
				 var d = JSON.parse(data);
				 console.log(d);
				 var list = d.list;
				 var html = "";
				 for(var i = 0; i < list.length; i++) {
					 html += "<tr><td>";
					 html += list[i].userNo;
					 html += "</td><td>";
					 html += list[i].userId;
					 html += "</td><td>";
					 html += list[i].userName;
					 html += "</td><td>";
					 html += list[i].regDate;
					 html += "</td></tr>"
					 
				 }
				 console.log(html);
				 $("#list").append(html);
			 });
		 });
		
		
	</script>
	<style>
		table {
		    border-collapse: collapse;
		    width: 100%;
		}
		
		th, td {
		    padding: 8px;
		    text-align: left;
		    border-bottom: 1px solid #ddd;
		}
		tr:hover {background-color:#f5f5f5;}
	</style>
</head>
<body>
	<h1>사용자 관리</h1>
	<table id="list">
		<tr > 
		    <th>사용자번호</th>
		    <th>아이디</th>
		    <th>이름</th>
		    <th>생성날짜</th>
  		</tr>
  		
	</table>
	
	<a href="user">사용자 추가</a>
	<a href="index">메인으로</a>
</body>
</html>
