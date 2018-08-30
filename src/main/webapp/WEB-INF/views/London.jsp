<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title> 매덩여행 - 런던 </title>
	<link rel="stylesheet" type="text/css" href="/Project/resources/index.css">

   <link rel="stylesheet" type="text/css"  media="only screen and (max-width: 1200px)" href="/Project/resources/tab.css">

   <link rel="stylesheet" type="text/css"  media="only screen and (max-width: 670px)" href="/Project/resources/phone.css">

	<link rel='shortcut icon' href='/Project/resources/icon/send.png'>
	<script type="text/javascript" src="webjars/jquery/3.3.1/dist/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			 $.ajax({
			 	type: "post",
			 	url : "sdl"
			 }).done(function(data){
				 var d = JSON.parse(data);
				 console.log(d);
				 var list = d.list;
				 
				/********런던board*********************************************/
				 var html = "";
				 for(var i = 0; i < list.length; i++) {
					 html += '<section class="bar" style="background-image: url(';
				 	 html += list[i].fileURL;
				 	 html += ')"><article><h1>';
				 	 html += list[i]. boardTitle;
				 	 html += '</h1><p>'
				 	 html += list[i]. boardContents;
				 	 html += '</p></article></section>'
					 
				 }
				 console.log(html);
				 $("#list").append(html);
				 /********************************************************/
				
				 
			 });
		 });
		
	</script>
</head>
<body>
	<c:if test="${sessionScope.user.status == 1}" >
		<a href="list?u=sdl" style="text-align: right; font-size: 20px">수정</a>
	</c:if>
	<section id="list">
	
	</section>
    <div id="before_button">
        <a href="index"><img src="/Project/resources/icon/before_icon.png" width="70px"></a>
    </div>
</body>
</html>
