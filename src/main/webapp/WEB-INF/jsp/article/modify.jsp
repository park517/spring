<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 사이트 - 게시물 수정</title>
</head>
<style>

	.con {
		width: 1000px;
		margin: 0 auto;
	}

</style>
<body>
	<h1>게시물 작성</h1>
	<form class="con common-form" action="./doModify" method="post" >
		<input type="hidden" name="id" value="${article.aid}">
		<div>
			<span>
				제목
			</span>
			<div>
				<input value="${article.title}" name="title" type="text" placeholder="제목" autofocus="autofocus">
			</div>
		</div>
		
		<div>
			<span>
				내용
			</span>
			<div>
				<textarea name="body" placeholder="내용">${article.contents}</textarea>
			</div>
		</div>
		
			
		<div>
			<span> 작성 </span>
			<div>
				<input type="submit" value="수정" >
				<input type="reset" value="취소" onclick="history.back();">
			</div>
		</div>
	
	</form>
</body>
</html>