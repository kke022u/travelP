<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>글 수정</title>
	<meta charset="UTF-8">
	<script type="text/javascript" src="webjars/jquery/3.3.1/dist/jquery.min.js"></script>
	<script>
	$(document).ready(function(){
		var delData = "";
		var fileNo ="";
	
		var boardNo = "${param.boardNo}";
		
		if(boardNo == ""){
			alert("누구세요?");
			location.href = "index";
		}else {
			$.ajax({
				  type : "post",
				  url : "bld",
				  data : {"boardNo" : boardNo}
			  }).done(function(data){
				  var d = JSON.parse(data)
				  var boardData = d.boardData;
				  fileNo = boardData.fileNo;
				  
				  boardHTML(boardData);
				  filesHTML(boardData);
			  });
		}
		
		
		$("form").submit(function(e){
			e.preventDefault();
			console.log($("form input").eq(1).val());
			
			if($("form input").eq(1).val()!= ""){
				delData = fileNo;
				console.log("삭제할 file: "+delData)
			}
			
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
				  url : "bud",
				  data : {
					  "boardNo" : boardNo,
					  "boardTitle" : $("form input").eq(0).val(),
					  "boardContents" : $("form textarea").eq(0).val(),
					  "data" : JSON.stringify(d.upload),
				  	  "delData" : JSON.stringify(delData)
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
		var title = data.boardTitle;
		var contents = data.boardContents;
		
		$("form input").eq(0).val(title);
		$("form textarea").eq(0).val(contents);
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
	제목 <input type="text" name="boardTitle" placeholder="제목 입력"><br>
	내용 <textarea type="text" name="boardContents" placeholder="내용 입력" ROWS=3 COLS=30></textarea><br>
	첨부파일 <input type="file" name="file" placeholder="사진"><br><br>
	<input type="submit" value="수정하기">
</form>
<button type="button" onclick ="location.href='bDel?boardNo=${param.boardNo}'">삭제하기</button>
<br><br>
<div id="files"></div>

</div>
</body>
</html>
