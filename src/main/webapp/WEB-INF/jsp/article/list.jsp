<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/static/index.css">
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
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

</style>
<body>
	<h1>게시판 리스트</h1>
	<form action="./add">
		<table class="table table-hover tablestriped text-center" style="border: 1px solid;">
			<thead>
				<th>아이디</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성일</th>
				<th>조회수</th>
			</thead>
			<c:forEach var="article" items="${list}">
				<tbody>
					<tr>
						<td>${article.id}</td>
						<td><a href="./detail?id=${article.id}">${article.title}</a></td>
						<td>${article.body}</td>
						<td>${article.regDate}</td>
						<td>${article.hit}</td>
					</tr>			
				</tbody>
			</c:forEach>
		</table>
		
		<button class="btn btn-primary">글 작성하기</button>
	
	
	
	</form>

	
</body>
</html>