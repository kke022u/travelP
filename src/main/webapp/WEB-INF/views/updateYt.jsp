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
	
		var vNum = "${param.vNum}";
		
		if(vNum == ""){
			alert("누구세요?");
			location.href = "index";
		}else {
			$.ajax({
				  type : "post",
				  url : "yld",
				  data : {"vNum" : vNum}
			  }).done(function(data){
				  var d = JSON.parse(data)
				  var boardData = d.boardData;
				  vNum = boardData.vNum;
				  
				  boardHTML(boardData);
			  });
		}
		
		$("form").submit(function(e){
			e.preventDefault();
			console.log("흠");
			
			$.ajax({
				  type : "post",
				  url : "yud",
				  data : {
					  "vNum" : vNum,
					  "vTitle" : $("form input").eq(0).val(),
					  "vContents" : $("form textarea").eq(0).val(),
					  "vUrl" : $("form input").eq(1).val()
				  }
			  }).done(function(data){
				  var d = JSON.parse(data)
				  alert(d.msg);
				  if(d.status == 1){
					location.href = "index";
				  }
			  });
		});
		
		
	function boardHTML(data){
		var vTitle = data.vTitle;
		var vContents = data.vContents;
		var vUrl = data.vUrl;
		
		$("form input").eq(0).val(vTitle);
		$("form textarea").eq(0).val(vContents);
		$("form input").eq(1).val(vUrl);
	};
	});
	</script>
</head>
<body>
<h1>
	 게시글 수정
</h1>
<div>
<form action="" method="post" >
	제목 <input type="text" name="vTitle" placeholder="제목 입력" ><br>
	내용 <textarea type="text" name="vContents" placeholder="내용 입력" ROWS=3 COLS=30></textarea><br>
	링크 <input type="text" name="vUrl" placeholder="링크" ><br><br>
	<input type="submit" value="수정하기">
</form>
<%-- <button type="button" onclick ="location.href='bDel?boardNo=${param.boardNo}'">삭제하기</button> --%>
<br><br>

</div>
</body>
</html>
