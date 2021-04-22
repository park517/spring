<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
 	<%@include file="../part/head.jspf" %>
 	<link rel="stylesheet" href="/resource/list.css">
    <title>게시판</title>
</head>
<body>
	<div class="nav">
		<%@include file="../part/nav.jspf" %>
		
	</div>
	<div class="jumbotron">
	
		<div class="container">
			<h2>게시판 리스트</h2>
			<div class="header">
					<select id="type" name="choice" class="selectpicker" data-style="btn-info">
					    <option value="">항목선택</option>
					    <option value="title">제목</option>
					    <option value="contents">내용</option>
					    <option value="mid">작성자</option>
					</select>
					<input class="form-control" id="search" onkeyup="search(1)"  type="text" size="20" placeholder="검색어를 입력해주세요!">
					<button class="btn btn-primary" onclick="search(1)" type="button">검색</button>
			</div>
			
			<form action="./add">
				<table id="articleList" class="table table-hover tablestriped text-center" style="border: 1px solid;">
					<thead>
						<th>글 번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</thead>
					<c:forEach var="article" items="${list}" varStatus="st">
						<tbody>
							<tr>
								<td>${st.index+1}</td>
								<td><a href="./detail?aid=${article.aid}">${article.title}</a></td>
								
								<td>${article.mid}</td>
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
			
			<ul class="pagination" id="pagination">
				<li class="disabled">
					<a href="#">
					<span>«</span>
					</a>
				</li>
				<c:forEach begin="1" end ="${article.paginationInfo.totalPageCount}" step="1" varStatus="status">
					<li id="${status.count}">
					<a href="/article/list?currentPageNo=${status.count}" >
					${status.count}
					</a>
					</li>
				</c:forEach>
				<li>
				<a href="#">
				<span>»</span>
				</a>
				</li>
			</ul>
			
					
			<ul class="pagination" id="pagination1" style="display: none;">

			</ul>
		</div>
	</div>
	
	<script src="/js/list.js"></script>
</body>
</html>