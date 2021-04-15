<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 사이트 - 게시물 리스트</title>
</head>
<body>
	<h1>게시물 리스트 입니다.</h1>
	<table>
		<thead>
			<th>아이디</th>
			<th>작성일</th>
			<th>제목</th>
			<th>내용</th>
		</thead>
		<tbody>
			<c:forEach var="n" items="${list}">
				<tr>
					<td>${n.id}</td>
					<td>${n.regDate}</td>
					<td>${n.title}</td>
					<td>${n.body}</td>
				</tr>
			</c:forEach>
		</tbody>	
	</table>
	<!-- el 문법 -->
</body>
</html>