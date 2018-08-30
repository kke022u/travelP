<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>글 작성</title>
	<meta charset="UTF-8">
	<script type="text/javascript" src="webjars/jquery/3.3.1/dist/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			$("form").submit(function(e){
				e.preventDefault();
				
				 $.ajax({
					 type: "post",
					  url: "http://FileServer/FileUpload/kke",
					  data: new FormData($(this)[0]),
					  contentType: false,
					  cache: false,
					  processData: false
				  }).done(function(data) {
					  var d = JSON.parse(data);
					  console.log(d);
					  $.ajax({
						  type: "post",
						  url: "bid",
						  data: {"boardTitle" : $("form input").eq(0).val(), 
							  	 "boardContents" : $("form textarea").eq(0).val(),
							  	 "boardType" : $("form input").eq(1).val(), 
							  	 "data" : JSON.stringify(d.upload)
							  	 }
					  }).done(function(data){
						  var d = JSON.parse(data);
						  alert(d.msg);
						  if(d.status == 1) {
							  location.href="index";
						  }
					  	  
					  })
				  });
			});
		});
	</script>
</head>
<body>
<h1>
	 글작성
</h1>
<form action="" method="post"  enctype="multipart/form-data">
	제목 <input type="text" name="boardTitle" placeholder="제목 입력"><br>
	내용 <textarea type="text" name="boardContents" placeholder="내용 입력" ROWS=3 COLS=30></textarea><br>
	<input list="browsers" name="browser" value=${param.i}>
	  <datalist id="browsers">
	    <option value="pickList">
	    <option value="detailLon">
	    <option value="detailBar">
  	</datalist>
	첨부파일 <input type="file" name="file" placeholder="사진"><br><br>
	<input type="submit" value="제출">
</form>
</body>
</html>
