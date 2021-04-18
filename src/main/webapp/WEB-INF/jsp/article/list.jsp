<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
 	<%@include file="../part/head.jspf" %>
	
  
    
    <title>Document</title>
</head>
<style>
	table {
		font-size: 15px;
		width: 800px;
	}
	th {
		text-align: center;
		font-size: 20px;
	}
	
	h2 {
		margin-top: 50px;
		margin-bottom: 30px;
	}

</style>
<body>
	<div class="nav">
		<%@include file="../part/nav.jspf" %>
		
	</div>
	<div class="jumbotron">
		<div class="container">
			<h2>게시판 리스트</h2>
			<form action="./add">
				<table class="table table-hover tablestriped text-center" style="border: 1px solid;">
					<thead>
						<th>글 번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>작성일</th>
						<th>조회수</th>
					</thead>
					<c:forEach var="article" items="${list}" varStatus="st">
						<tbody>
							<tr>
								<td>${st.index+1}</td>
								<td><a href="./detail?aid=${article.aid}">${article.title}</a></td>
								<td>${article.contents}</td>
								<td>${article.regDate}</td>
								<td>${article.hit}</td>
							</tr>			
						</tbody>
					</c:forEach>
				</table>
				<c:if test="${!empty loginMember}">
					<button class="btn btn-primary">글 작성하기</button>
				</c:if>
			</form>
		</div>	
	</div>
	

	
</body>
</html>