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
			 	url : "boardList"
			 }).done(function(data){
				 var d = JSON.parse(data);
				 console.log(d);
				 var list = d.list;
				 var html = "";
				 for(var i = 0; i < list.length; i++) {
					 html += "<tr><td>";
					 html += list[i].boardNo;
					 html += "</td><td><a href='updateBoard?boardNo=";
					 html += list[i].boardNo;
					 html += "'>";
					 html += list[i].boardTitle;
					 html += "</a></td><td>";
					 html += list[i].boardContents;
					 html += "</td><td>";
					 html += list[i].boardType;
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
	<h1>게시글 관리</h1>
	<table id="list">
		<tr > 
		    <th>boardNo</th>
		    <th>제목</th>
		    <th>내용</th>
		    <th>boardType</th>
		 <th>작성날짜</th>
  		</tr>
  		
	</table>
	<a href="insert">글 작성</a>
	<a href="admin">메인으로</a>
</body>
</html>
