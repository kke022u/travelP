<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>글 수정</title>
	<meta charset="UTF-8">
	<script type="text/javascript" src="webjars/jquery/3.3.1/dist/jquery.min.js"></script>
	<script>
	$(document).ready(function(){
	
		var fileNo = "${param.fileNo}";
		
		if(fileNo == ""){
			alert("누구세요?");
			location.href = "index";
		}else {
			$.ajax({
				  type : "post",
				  url : "fld",
				  data : {"fileNo" : fileNo}
			  }).done(function(data){
				  var d = JSON.parse(data)
				  var boardData = d.boardData;
				  
				  boardHTML(boardData);
				  filesHTML(boardData);
			  });
		}
		
		
		$("form").submit(function(e){
			e.preventDefault();
			
			$.ajax({
				type: "post",
				url : "http://FileServer/FileUpload/kke",
				data: new FormData($(this)[0]),
				contentType: false,
				cache: false,
				processData: false
			}).done(function(data) {
				  var d = JSON.parse(data);
				  update(d);
			});
		});
		
		function update(d){
			  $.ajax({
				  type : "post",
				  url : "fud",
				  data : {
					  "fileNo" : fileNo,
					  "fileName" : $("form input").eq(0).val(),
					  "data" : JSON.stringify(d.upload)
				  }
			  }).done(function(data){
				  var d = JSON.parse(data)
				  alert(d.msg);
				  if(d.status == 1){
					location.href = "index";
				  }
			  });
		};
		
	function boardHTML(data){
		var title = data.fileName;
		
		$("form input").eq(0).val(title);
	};
	
	function filesHTML(data){
		$("#files").empty();
		
		var fileURL = data.fileURL;
		var html = "<img src='"+fileURL+"' width='20%' height='20%'><br>";
		$("#files").append(html);
		
		
// 		$("img").on("click", function(){
// 			var fileNo = data.fileNo;
// 			delData = fileNo;
// 			console.log(delData);
// 			$("img").remove();
// 			});
		};
	});
	</script>
</head>
<body>
<h1>
	 게시글 수정
</h1>
<div>
<form action="" method="post"  enctype="multipart/form-data">
	이름 <input type="text" name="boardTitle" placeholder="제목 입력"><br>
	첨부파일 <input type="file" name="file" placeholder="사진"><br><br>
	<input type="submit" value="수정하기">
</form>

<div id="files"></div>

</div>
</body>
</html>
