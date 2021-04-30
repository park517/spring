<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<%@include file="../part/head.jspf" %>

<title>커뮤니티 사이트 - 게시물 수정</title>
</head>
<style>

	.con {
		width: 1000px;
		margin: 0 auto;
	}

</style>
<body>

	<div class="jumbotron">
		<article>
			<div class="container" role="main">
				<h1>글 내용 보기</h1>
				<form name="form" id="form" role="form" method="post" action="./doModify">
					<input type="hidden" name="aid" value="${article.aid}">
					<div class="mb-3">
						<label for="title">제목</label>
						<input type="text" class="form-control" name="title" id="title" value="${article.title}">
	                </div>
	                
			        <div class="mb-3">
			            <label for="file"><strong>첨부 파일</strong></label>
						<input multiple="multiple" type="file" class="form-control" name="file" id="file" placeholder="파일을 선택해 주세요">
			        </div>
			        
			        <c:if test="${!empty files}">
		                <div class="mb-3">
							<label for="title">첨부파일목록</label>
							<c:forEach var="file" items="${files}" varStatus="status">
								<p>
								<input type="checkbox" value="${file.fileRealName}" name="file_check">
								${file.fileRealName}
								</p>
								
						    </c:forEach>
						    <button type="button" class="btn btn-danger">파일삭제하기</button>
		                </div>
	                </c:if>
	
	
					<div class="mb-3">
						<label for="content">내용</label>
						<textarea class="form-control" rows="5" name="contents" id="content">${article.contents}</textarea>
					</div>
					<div class="btn_group">
						<input type="submit"class="btn btn-sm btn-primary" value="수정" >
						<input type="reset" class="btn btn-sm btn-primary" value="취소" onclick="history.back();">
					</div>
	
				</form>

	
			</div>
		</article>
	</div>
</body>
</html>