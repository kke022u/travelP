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
			var type = "${param.u}"
			if(type=="spl"){
				executeBoard(type);
			}
			if(type=="ssb"){
				executeFile(type);
			}
			if(type=="sdb" || type == "sdl"){
				executeDetail(type);
			}
			if(type == "syl"){
				executeYt(type);
			}
			
			
			function executeBoard(type){
				 $.ajax({
					 	type: "post",
					 	url : type
					 }).done(function(data){
						 var d = JSON.parse(data);
						 console.log(d);
						 var list = d.list;
						 for(var i = 0; i < list.length; i++) {
							 var html = "<li>"; 
							 /*****************/
							 
							 html += "<a href=updateBoard?boardNo=";
							 html += list[i].boardNo;
							 html += "><br>";
							 html += list[i].boardTitle;
							 html += "<br>";
							 html += "<br><img src='";
							 html += list[i].fileURL;
							 html += "' width='20%' >"
							 /*****************/
							 
							 html += "</li>";
							 $("#list").append(html);
						 }
						 $("#h1_title").append("매덩스 픽 목록");
						 
						 var html2 = "<a href='insert?i=pickList'>글작성</a>";
						 $("#insert").append(html2);
					 });
			}
			
			function executeFile(type){
				 $.ajax({
					 	type: "post",
					 	url : type
					 }).done(function(data){
						 var d = JSON.parse(data);
						 console.log(d);
						 var list = d.list;
						 for(var i = 0; i < list.length; i++) {
							 var html = "<li>"; 
							 /*****************/
							 
							 html += "<a href=updateFile?fileNo=";
							 html += list[i].fileNo;
							 html += ">";
							 html += list[i].fileName;
							 html += "<br>";
							 html += "<img src='";
							 html += list[i].fileURL;
							 html += "' width='20%' >"
							
							 /*****************/
							 
							 html += "</li>";
							 $("#list").append(html);
						 }

						 $("#h1_title").append("슬라이드 목록");	 
					 });
			}
			function executeDetail(type){
				 $.ajax({
					 	type: "post",
					 	url : type
					 }).done(function(data){
						 var d = JSON.parse(data);
						 console.log(d);
						 var list = d.list;
						 for(var i = 0; i < list.length; i++) {
							 var html = "<li>"; 
							 /*****************/
							 
							 html += "<a href=updateBoard?boardNo=";
							 html += list[i].boardNo;
							 html += ">";
							 html += list[i].boardTitle;
							 html += "<br>";
							 html += list[i].boardContents;
							 html += "<br><img src='";
							 html += list[i].fileURL;
							 html += "' width='20%' >"
							 /*****************/
							 
							 html += "</li>";
							 $("#list").append(html);
						 }
						 $("#h1_title").append("");
						 
						 if(type=="sdb"){
							 type = "detailBar";
						 }else if(type =="sdl"){
							 type="detailLon";
						 }
						 
						 var html2 = "<a href='insert?i=";
						 html2 += type;
						 html2 += "'>글작성</a>";
						 $("#insert").append(html2);
					 });
			}
			function executeYt(type){
				 $.ajax({
					 	type: "post",
					 	url : type
					 }).done(function(data){
						 var d = JSON.parse(data);
						 console.log(d);
						 var list = d.list;
						 for(var i = 0; i < list.length; i++) {
							 var html = "<li>"; 
							 /*****************/
							 
							 html += "<a href=updateYt?vNum=";
							 html += list[i].vNum;
							 html += "><p>";
							 html += list[i].vTitle;
							 html += "</p><p>";
							 html += list[i].vContents;
							 html += '</p><Br><iframe src="';
							 html += list[i].vUrl;
							 html += '" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>';
							
							 /*****************/
							 
							 html += "</li>";
							 $("#list").append(html);
						 }

						 $("#h1_title").append("유투브 목록");	 
					 });
			}
			
		 });
		
		
	</script>
</head>
<body>
	<h1 id=h1_title></h1>
	<ul id="list">
	</ul>
	<a href="index">메인으로</a>
	<div id="insert"></div>
</body>
</html>
