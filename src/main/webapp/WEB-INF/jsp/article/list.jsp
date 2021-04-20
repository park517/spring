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
					<select name="choice" class="selectpicker" data-style="btn-info">
					    <option value="">항목선택</option>
					    <option value="학생">제목</option>
					    <option value="회사원">내용</option>
					    <option value="기타">작성자</option>
					</select>
					<input class="form-control" id="search" onkeyup="searchFunction()"  type="text" size="20" placeholder="검색어를 입력해주세요!">
					<button class="btn btn-primary" onclick="searchFunction()" type="button">검색</button>
			</div>
			
			<form action="./add">
				<table class="table table-hover tablestriped text-center" style="border: 1px solid;">
					<thead>
						<th>글 번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</thead>
					<c:forEach var="article" items="${list}" varStatus="st">
						<tbody>
							<tr>
								<td>${st.index+1}</td>
								<td><a href="./detail?aid=${article.aid}">${article.title}</a></td>
								<td>${article.contents}</td>
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
			
			<ul class="pagination">
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
		</div>
	</div>
	
	

	<script>
		
		let url = window.location.search;
		console.log("url : "+url);
		url  =  url.replace("?","");
		console.log("url : " +url);
		let list = url.split('=');
		let page = document.getElementById(list[1]);
		console.log("page : "+page);
		page.classList.add('active');

	</script>



	
</body>
</html>