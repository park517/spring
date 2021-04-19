<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@include file="../part/head.jspf" %>
 <link rel="stylesheet" href="/resource/detail.css">
<title>board</title>
<script>

	$(document).on('click', '#btnUpdate', function(e){
		e.preventDefault();
		let deleteCheck = confirm("수정하시겠습니까?");
		if(deleteCheck)	$("#form").submit();
	});
	$(document).on('click', '#btnList', function(e){
		e.preventDefault();
		location.href="./list";
	});
	$(document).on('click', '#btnDelete', function(e){
		e.preventDefault();
		let deleteCheck = confirm("삭제하시겠습니까?");
		
		if(deleteCheck)	location.href="./doDelete?aid=${article.aid}";
	});

</script>
</head>
<body>
	<%@include file="../part/nav.jspf" %>
	<div class="jumbotron">
		<article>
			<div class="container" role="main">
				<h1>글 내용 보기</h1>
				<form name="form" id="form" role="form" method="post" action="./modify?aid=${article.aid}">
					<div class="mb-3">
						<label for="title">제목</label>
						<input type="text" class="form-control" name="title" id="title" readonly="readonly" value="${article.title}">
	                </div>
	                <c:if test="${!empty file}">
		                <div class="mb-3">
							<label for="title">첨부파일</label>
							<p><a href="/article/fileDown/${file.aid}">${file.fileRealName}</a><p>
		                </div>
	                </c:if>
	
					<div class="mb-3">
						<label for="content">내용</label>
						<textarea class="form-control" rows="5" name="contents" id="content" readonly="readonly">${article.contents}</textarea>
					</div>
	
				</form>
				<div class="btn_group">
					<c:if test="${article.mid eq loginMember.mid}">
						<button type="button" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>
						<button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>
					</c:if>
					<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
	
				</div>
	
			</div>
		</article>
	</div>
	

</body>

</html>
